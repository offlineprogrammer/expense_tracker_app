import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:expense_tracker_app/models/Category.dart';
import 'package:expense_tracker_app/services/auth_service.dart';
import 'package:expense_tracker_app/services/datastore_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController to = Get.find();
  DataStoreService _dataStoreService = DataStoreService();
  AuthService _authService = AuthService();
  RxBool isLoading = false.obs;

  final TextEditingController categoryNameController = TextEditingController();
  final FocusNode categoryNameFocusNode = FocusNode();

  List<Category> categoriesList = <Category>[].obs;

  @override
  void onReady() {
    getCategories();
    super.onReady();
  }

  Future<void> getCategories() async {
    AuthUser _authUser = await _authService.getCurrentUser();
    List<Category>? _list =
        await _dataStoreService.getCategories(_authUser.userId);
    if (_list != null) {
      categoriesList.addAll(_list);
    }
  }

  Future<void> saveCategory(String userId) async {
    try {
      print(userId);
      print(categoryNameController.text);
      Category _category = new Category(
          categoryname: categoryNameController.text, userID: userId);

      await _dataStoreService.saveCategory(_category);
      categoryNameController.clear();
      categoriesList.add(_category);
    } catch (e) {} finally {
      isLoading.value = false;
    }
  }

  Future<void> removeCategory(Category category) async {
    await _dataStoreService.removeCategory(category);

    categoriesList.remove(category);
  }
}
