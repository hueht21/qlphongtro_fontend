import 'dart:developer';

import 'package:get/get.dart';
import 'package:qlphongtro/app/core/base/base_controlers.dart';
import 'package:qlphongtro/app/modules/post/models/post_status_model.dart';

import '../../post_waiting/controllers/post_wating_controller.dart';
import '../responstory/post_status_responstory.dart';

class PostController extends BaseGetxController{

  PostWaitingController postWaitingController = Get.find();

  Future<void> getPostStatus(int idPost,int idUser) async {
    showLoadingOverlay();
    PostStatus postStatus = PostStatus(idPost: idPost, status: 1,idUser: idUser);
    String status = await PostStatusResponstory(this).getResponPost(postStatus);
    hideLoadingOverlay();
    // showSnackBar(status);
    await postWaitingController.setListPostModel();
    Get.back();

    log(status);
  }


}