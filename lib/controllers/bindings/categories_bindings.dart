import 'package:expense_tracker_app/controllers/auth_controller.dart';
import 'package:expense_tracker_app/controllers/category_controller.dart';
import 'package:expense_tracker_app/controllers/user_controller.dart';
import 'package:get/get.dart';

class CategoriesBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<UserController>(UserController(), permanent: true);
    Get.put<CategoryController>(CategoryController(), permanent: true);
  }
}
