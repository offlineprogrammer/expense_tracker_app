import 'dart:io';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:expense_tracker_app/models/User.dart';
import 'package:expense_tracker_app/services/auth_service.dart';
import 'package:expense_tracker_app/services/datastore_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class UserController extends GetxController {
  static UserController to = Get.find();
  DataStoreService _datastoreService = DataStoreService();
  AuthService _authService = AuthService();
  Rxn<User> currentUser = Rxn<User>();
  RxBool isLoading = false.obs;
  RxString imageUrl = ''.obs;
  final TextEditingController displaynameController = TextEditingController();

  User? get user => currentUser.value;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getCurrUser();
    super.onReady();
  }

  Future<void> getCurrUser() async {
    AuthUser authUser = await _authService.getCurrentUser();
    currentUser.value = await _datastoreService.getUser(authUser.userId);
    print(currentUser.value);
  }

  Future<void> updateDisplayName() async {
    currentUser.value =
        currentUser.value!.copyWith(displayname: displaynameController.text);
    await _datastoreService.saveUser(currentUser.value!);
    displaynameController.clear();
    //await _analyticsService.recordEvent('update_monster');
  }

  Future<void> setUserImage() async {
    File _image;
    final picker = ImagePicker();

    try {
      isLoading.value = true;
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        _image = File(pickedFile.path);

        _image.existsSync();
        final userImageKey = currentUser.value!.id + Uuid().v1() + '.png';
        print(userImageKey);

        Map<String, String> metadata = <String, String>{};
        metadata['name'] = currentUser.value!.id;
        metadata['desc'] = 'A test file';
        S3UploadFileOptions options = S3UploadFileOptions(
            accessLevel: StorageAccessLevel.guest, metadata: metadata);
        print(_image.toString());
        UploadFileResult result = await Amplify.Storage.uploadFile(
            key: userImageKey, local: _image, options: options);
        print('uploaded');
        GetUrlOptions _getUrlOptions = GetUrlOptions(expires: 60000);
        GetUrlResult resultUrl = await Amplify.Storage.getUrl(
            key: userImageKey, options: _getUrlOptions);
        print('URL: ' + resultUrl.url);

        // currentUser.value = currentUser.value!
        //     .copyWith(imageKey: userImageKey, imageUrl: resultUrl.url);

        print(currentUser.value);

        imageUrl.value = resultUrl.url;

        await _datastoreService.saveUser(currentUser.value!);
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
