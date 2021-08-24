import 'package:expense_tracker_app/controllers/category_controller.dart';
import 'package:expense_tracker_app/controllers/user_controller.dart';
import 'package:expense_tracker_app/widgets/category_card.dart';
import 'package:expense_tracker_app/widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesPage extends GetWidget<CategoryController> {
  UserController _userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE1E5E4),
        appBar: AppBar(
          title: Text(
            'Categories',
          ),
          centerTitle: true,
        ),
        drawer: const HomeDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.dialog(AlertDialog(
              title: Text('Add Category here'),
              content: TextFormField(
                controller: controller.categoryNameController,
                decoration: InputDecoration(hintText: "Category Name"),
              ),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () async {
                    if (controller.categoryNameController.text != "") {
                      await controller
                          .saveCategory(_userController.currentUser.value!.id);
                      controller.categoryNameController.clear();
                    }
                    Get.back();
                  },
                ),
              ],
            ));
          },
          child: Icon(Icons.add),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 8,
              ),
              Text(
                "Your Expenses",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Obx(
                () => Expanded(
                  child: ListView.builder(
                    itemCount: controller.categoriesList.length,
                    itemBuilder: (_, index) {
                      return CategoryCard(
                          category: controller.categoriesList[index]);
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
