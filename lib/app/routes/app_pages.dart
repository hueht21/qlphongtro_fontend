import 'package:get/get.dart';
import 'package:qlphongtro/app/modules/home_admin/binding/home_admin_binding.dart';
import 'package:qlphongtro/app/modules/recharge/views/recharge_view.dart';
import '../modules/accout_personnel/views/accout_personnel_page.dart';
import '../modules/config_role/views/config_role_views.dart';
import '../modules/create_personnal/bindings/create_presonnal_binding.dart';
import '../modules/create_personnal/views/create_personnal_page.dart';
import '../modules/home_admin/views/home_admin_page.dart';
import '../modules/login/bingdings/login_bingding.dart';
import '../modules/login/views/login_page.dart';
import '../modules/post/views/post_view.dart';
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
      binding: LoginBingding()
    ),
    GetPage(
      name: _Paths.ACCOUT_PERSONNAL,
      page: () => const AccoutPersonnalPage(),
      // binding: AccoutPersonnalBinding()
    ),
    GetPage(
      name: _Paths.CREATE_ACC_PERSONNAL,
      page: () => CreateAccPersonnal(),
      binding: CreatePresonnalBinding()
    ),
    GetPage(
      name: _Paths.CONFIG_ROLE,
      page: () => ConfigRolePage(),
    ),

    GetPage(
      name: _Paths.VIEW_POST,
      page: () => PostViewPage(),
    ),

    GetPage(
      name: _Paths.RECHARGE,
      page: () => RechargeView(),

    ),
  ];
}
