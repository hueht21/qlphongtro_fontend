import 'package:get/get.dart';

import '../../accout_personnel/controllers/accout_personnal_controller.dart';

class CreatePresonnalBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AccoutPersonnalController>(() => AccoutPersonnalController());
  }

}