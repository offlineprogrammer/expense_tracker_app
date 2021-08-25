import 'package:amplify_flutter/amplify.dart';
import 'package:expense_tracker_app/models/Category.dart';
import 'package:expense_tracker_app/models/Expense.dart';
import 'package:expense_tracker_app/models/User.dart';

class DataStoreService {
  Future<void> saveUser(User user) async {
    try {
      print('DataStore Save');
      //await Amplify.DataStore.clear();
      await Amplify.DataStore.save(user);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<void> saveCategory(Category _category) async {
    try {
      await Amplify.DataStore.save(_category);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<void> removeCategory(Category _category) async {
    try {
      await Amplify.DataStore.delete(_category);
    } catch (e) {
      throw e;
    }
  }

  Future<List<Category>?> getCategories(String userId) async {
    try {
      List<Category> categories = await Amplify.DataStore.query(
          Category.classType,
          where: Category.USERID.eq(userId));
      if (categories.length > 0) {
        return categories;
      } else
        return null;
    } catch (e) {
      throw e;
    }
  }

  Future<void> saveExpense(Expense _category) async {
    try {
      await Amplify.DataStore.save(_category);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<void> removeExpense(Expense _category) async {
    try {
      await Amplify.DataStore.delete(_category);
    } catch (e) {
      throw e;
    }
  }

  Future<List<Expense>?> getExpenses(String userId) async {
    try {
      List<Expense> categories = await Amplify.DataStore.query(
          Expense.classType,
          where: Expense.USERID.eq(userId));
      if (categories.length > 0) {
        return categories;
      } else
        return null;
    } catch (e) {
      throw e;
    }
  }

  Future<User?> getUser(String userId) async {
    try {
      List<User> user = await Amplify.DataStore.query(User.classType,
          where: User.ID.eq(userId));
      if (user.length > 0) {
        return user.first;
      } else
        print('null');
      return null;
    } catch (e) {
      throw e;
    }
  }
}
