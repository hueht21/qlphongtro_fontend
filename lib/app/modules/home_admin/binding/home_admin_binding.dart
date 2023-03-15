import 'package:get/get.dart';
import 'package:qlphongtro/app/application/app.dart';

import '../../accout_personnel/controllers/accout_personnal_controller.dart';
import '../controllers/home_admin_controller.dart';

class HomeAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeAdminController>(
      () => HomeAdminController(),
    );
    Get.lazyPut<AppController>(() => AppController());
    Get.lazyPut<AccoutPersonnalController>(
      () => AccoutPersonnalController(),
    );
  }
}
