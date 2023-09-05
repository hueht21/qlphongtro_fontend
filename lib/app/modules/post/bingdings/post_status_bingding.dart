import 'package:get/get.dart';

import '../../post_waiting/controllers/post_wating_controller.dart';
import '../controllers/post_controller.dart';

class PostStatusBingding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<PostController>(
          () => PostController(),
    );
    // Get.lazyPut<PostWaitingController>(
    //       () => PostWaitingController(),
    // );
  }

}