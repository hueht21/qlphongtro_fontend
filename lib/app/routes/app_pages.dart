import 'package:get/get.dart';
import 'package:qlphongtro/app/modules/home_admin/binding/home_admin_binding.dart';
import 'package:qlphongtro/app/modules/login/login_views/login_page.dart';

import '../modules/home/binding/home_binding.dart';
import '../modules/home/views/home_page.dart';
import '../modules/home_admin/views/home_admin_page.dart';
part 'app_routes.dart';



class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeAdminPage(),
      binding: HomeAdminBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginPage(),
    ),
  ];
}
