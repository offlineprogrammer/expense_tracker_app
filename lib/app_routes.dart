import 'package:expense_tracker_app/controllers/bindings/categories_bindings.dart';
import 'package:expense_tracker_app/controllers/bindings/homepage_bindings.dart';
import 'package:expense_tracker_app/pages/categories_page.dart';
import 'package:expense_tracker_app/pages/email_sign_in_page.dart';
import 'package:expense_tracker_app/pages/home_page.dart';
import 'package:expense_tracker_app/pages/sign_in_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/home', page: () => HomePage(), binding: HomeBindings()),
    GetPage(
      name: '/emaillogin',
      page: () => EmailSignInPage(),
    ),
    GetPage(
      name: '/signin',
      page: () => SignInPage(),
    ),
    GetPage(
      name: '/categories',
      page: () => CategoriesPage(),
      binding: CategoriesBindings(),
    ),
  ];
}
