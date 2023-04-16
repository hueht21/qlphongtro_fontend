
import 'package:get/get.dart';



bool isMobile = false;
bool isWeb = false;


class AppController extends GetxController {
  RxBool isLogin = false.obs;

  int isRoleMenu = 0; /// 0 : khach hang
  /// 1 : admin
  /// 2 : admin ht

  @override
  void onInit() {
    // Get.put(BaseRequest(), permanent: true);
    //
    // Get.put(BaseGetxController(), permanent: true);
    super.onInit();
  }

}
