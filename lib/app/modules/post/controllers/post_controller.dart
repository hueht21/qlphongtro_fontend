import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:qlphongtro/app/core/base/base_controlers.dart';
import 'package:qlphongtro/app/modules/post/models/img_model.dart';
import 'package:qlphongtro/app/modules/post/models/post_status_model.dart';
import 'package:qlphongtro/app/modules/post_waiting/models/post_model.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../post_waiting/controllers/post_wating_controller.dart';
import '../responstory/post_status_responstory.dart';

class PostController extends BaseGetxController {
  PostWaitingController postWaitingController = Get.find();

  PostModel post = Get.arguments;

  // Phân tích chuỗi JSON thành danh sách đối tượng Dart

  List<String> listImg = [];

  List<String> listImgConvert = [];

  Future<void> getPostStatus(int idPost, int idUser, int idStatus) async {
    showLoadingOverlay();
    PostStatus postStatus =
        PostStatus(idPost: idPost, status: idStatus, idUser: idUser);
    String status = await PostStatusResponstory(this).getResponPost(postStatus);
    hideLoadingOverlay();
    // showSnackBar(status);
    await postWaitingController.setListPostModel();


    log(status);
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    // jsonData = jsonDecode(post.userResponse.);
    for (int i = 0; i < post.areaResponse!.roomResponses.length; i++) {
      listImg.add(post.areaResponse!.roomResponses[i].image ?? "");
    }
    for (int i = 0; i < listImg.length; i++) {
      List<dynamic> jsonData = jsonDecode(listImg[i]);
      List<String> webViewLinks = jsonData.map((data) {
        return MyDataLinkImg.fromJson(data).webViewLink;
      }).toList();

      listImgConvert
          .add(webViewLinks[0].replaceAll('(', '').replaceAll(')', ''));
    }
    print(listImg);
    print(listImgConvert);
  }
}
