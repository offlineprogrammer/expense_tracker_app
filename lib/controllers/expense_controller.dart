import 'dart:ffi';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:expense_tracker_app/models/Expense.dart';
import 'package:expense_tracker_app/services/analytics_service.dart';
import 'package:expense_tracker_app/services/auth_service.dart';
import 'package:expense_tracker_app/services/datastore_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpenseController extends GetxController {
  static ExpenseController to = Get.find();
  DataStoreService _dataStoreService = DataStoreService();
  AnalyticsService _analyticsService = AnalyticsService();
  AuthService _authService = AuthService();
  RxBool isLoading = false.obs;
  RxString expenseCategoryName = 'Entertainment'.obs;

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
    await Future.delayed(Duration(seconds: 3));
    print('Get Kidz');
    AuthUser _authUser = await _authService.getCurrentUser();
    List<Expense>? _list =
        await _dataStoreService.getExpenses(_authUser.userId);
    expensesList.clear();
    if (_list != null) {
      expensesList.addAll(_list);
      print('Get the Kidz');
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
      await _analyticsService.recordEvent('add_expense');
    } catch (e) {} finally {
      isLoading.value = false;
    }
  }

  Future<void> removeExpense(Expense expense) async {
    await _dataStoreService.removeExpense(expense);
    expensesList.remove(expense);
    await _analyticsService.recordEvent('remove_expense');
  }
}
