import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginBingding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
          () => LoginController(),
    );
  }
}
