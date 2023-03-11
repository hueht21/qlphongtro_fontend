import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../core/base/base_controlers.dart';
import '../core/base/base_request.dart';



class AppController extends GetxController {
  RxBool isLogin = false.obs;

  @override
  void onInit() {
    // Get.put(BaseRequest(), permanent: true);
    //
    // Get.put(BaseGetxController(), permanent: true);
    super.onInit();
  }

}
