import 'dart:math';

import 'package:expense_tracker_app/controllers/category_controller.dart';
import 'package:expense_tracker_app/controllers/expense_controller.dart';
import 'package:expense_tracker_app/controllers/user_controller.dart';
import 'package:expense_tracker_app/models/Category.dart';
import 'package:expense_tracker_app/pages/categories_page.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AddExpenseAlert extends GetWidget<ExpenseController> {
  UserController _userController = Get.find();
  CategoryController _categoryController = Get.find();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Add Expense here',
        textAlign: TextAlign.center,
      ),
      content: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        child: SingleChildScrollView(
          child: ListBody(children: [
            TextFormField(
                textAlign: TextAlign.center,
                style: new TextStyle(fontSize: 70, color: Colors.black),
                autofocus: true,
                controller: controller.expenseValueController,
                focusNode: controller.expenseValueFocusNode,
                autocorrect: false,
                decoration: InputDecoration(hintText: "0.00"),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                onEditingComplete: () => _submit(),
                onChanged: controller.updateform),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
                autofocus: true,
                controller: controller.expenseNameController,
                focusNode: controller.expenseNameFocusNode,
                autocorrect: false,
                decoration: InputDecoration(hintText: "Expense Name"),
                textInputAction: TextInputAction.done,
                onEditingComplete: () => _submit(),
                onChanged: controller.updateform),
            SizedBox(
              height: 20.0,
            ),
            Obx(
              () => new DropdownButton<String>(
                isExpanded: true,
                hint: Text("Status"),
                value: controller.expenseCategoryName.value,
                items: _categoryController.categoriesList.map((Category value) {
                  return new DropdownMenuItem<String>(
                    value: value.categoryname,
                    child: new Text(value.categoryname),
                  );
                }).toList(),
                onChanged: (String? val) {
                  controller.expenseCategoryName.value = val!;
                },
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
          ]),
        ),
      ),
      actions: [
        Obx(
          () => TextButton(
            child: Text('OK'),
            onPressed: controller.submitEnabled.value ? _submit : null, //,
          ),
        ),
      ],
    );
  }

  Future<void> _submit() async {
    await controller.saveExpense(
        _userController.currentUser.value!.id,
        _categoryController.categoriesList
            .firstWhere((element) =>
                element.categoryname == controller.expenseCategoryName.value)
            .id);
    Get.back();
  }
}
