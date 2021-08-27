import 'package:expense_tracker_app/controllers/auth_controller.dart';
import 'package:expense_tracker_app/controllers/expense_controller.dart';
import 'package:expense_tracker_app/controllers/user_controller.dart';
import 'package:expense_tracker_app/widgets/add_expense_alert.dart';
import 'package:expense_tracker_app/widgets/expense_card.dart';
import 'package:expense_tracker_app/widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetWidget<UserController> {
  ExpenseController _expenseController = Get.find();

  get kTransparentImage => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE1E5E4),
        appBar: AppBar(
          title: Text(
            'All Expenses',
          ),
          centerTitle: true,
        ),
        drawer: const HomeDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.dialog(AddExpenseAlert());
          },
          child: Icon(Icons.add),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20,
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
                height: 20,
              ),
              Obx(
                () => _expenseController.expensesList.length != 0
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: _expenseController.expensesList.length,
                          itemBuilder: (_, index) {
                            return ExpenseCard(
                                expense:
                                    _expenseController.expensesList[index]);
                          },
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
              ),
            ],
          ),
        ));
  }
}
