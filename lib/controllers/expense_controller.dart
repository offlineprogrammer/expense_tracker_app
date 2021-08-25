import 'dart:ffi';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:expense_tracker_app/models/Expense.dart';
import 'package:expense_tracker_app/services/auth_service.dart';
import 'package:expense_tracker_app/services/datastore_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpenseController extends GetxController {
  static ExpenseController to = Get.find();
  DataStoreService _dataStoreService = DataStoreService();
  AuthService _authService = AuthService();
  RxBool isLoading = false.obs;
  RxString expenseCategoryName = 'School'.obs;

  final TextEditingController expenseNameController = TextEditingController();
  final TextEditingController expenseValueController = TextEditingController();
  final FocusNode expenseNameFocusNode = FocusNode();
  final FocusNode expenseValueFocusNode = FocusNode();
  RxBool submitEnabled = true.obs;

  List<Expense> expensesList = <Expense>[].obs;

  @override
  void onReady() {
    getExpenses();
    super.onReady();
  }

  Future<void> getExpenses() async {
    AuthUser _authUser = await _authService.getCurrentUser();
    List<Expense>? _list =
        await _dataStoreService.getExpenses(_authUser.userId);
    if (_list != null) {
      expensesList.addAll(_list);
    }
  }

  void updateform(String value) {
    // submitEnabled.value = GetUtils.isEmail(emailController.text) &&
    //     !GetUtils.isBlank(passwordController.text)! &&
    //     !isLoading.value;
  }

  Future<void> saveExpense(String userId, String categoryId) async {
    try {
      Expense _expense = new Expense(
          userID: userId,
          categoryID: categoryId,
          expensename: expenseNameController.text,
          expensevalue: double.parse(expenseValueController.text));

      await _dataStoreService.saveExpense(_expense);
      expenseNameController.clear();
      expenseValueController.clear();
      expensesList.add(_expense);
    } catch (e) {} finally {
      isLoading.value = false;
    }
  }

  Future<void> removeExpense(Expense expense) async {
    await _dataStoreService.removeExpense(expense);

    expensesList.remove(expense);
  }
}
