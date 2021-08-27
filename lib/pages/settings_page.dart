import 'package:expense_tracker_app/controllers/user_controller.dart';
import 'package:expense_tracker_app/widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends GetWidget<UserController> {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE1E5E4),
        appBar: AppBar(
          title: Text(
            'Expenses',
          ),
          centerTitle: true,
        ),
        drawer: const HomeDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => (controller.imageUrl.value != null &&
                          controller.imageUrl.value.isEmpty == false)
                      ? Container(
                          height: 150,
                          child: controller.isLoading.value == true
                              ? const Center(child: CircularProgressIndicator())
                              : Image.network(controller.imageUrl.value))
                      : Container(
                          color: Color(0xffE1E5E4),
                          height: 150,
                          child: Image.asset(
                            'images/profile_image.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                ),
                SizedBox(
                  height: 8,
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new IconButton(
                      onPressed: () => controller.setUserImage(),
                      icon: Icon(Icons.camera_alt),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Obx(
                  () => Text(
                    controller.currentUser.value!.displayname.isEmpty
                        ? '(Display Name)'
                        : controller.currentUser.value!.displayname,
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Obx(
                  () => Text(
                    controller.currentUser!.value!.username,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Divider(color: Colors.black),
                SizedBox(height: 20),
                Text(
                  'Update Your Details',
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                TextField(
                  controller: controller.displaynameController,
                  autocorrect: false,
                  textInputAction: TextInputAction.done,
                  // autofocus: true,
                  onEditingComplete: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    controller.updateDisplayName();
                  },
                  decoration: const InputDecoration(
                    labelText: 'Display Name',
                    prefixIcon: Icon(Icons.badge),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: controller.updateDisplayName,
                    child: Text(
                      'Save',
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
