
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlphongtro/app/core/utils/font_utils.dart';
import 'package:qlphongtro/app/modules/post_waiting/models/post_model.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/const.dart';
import '../../../core/values/dimens.dart';
import '../../post_waiting/controllers/post_wating_controller.dart';
import '../../post_waiting/models/post.dart';
import '../controllers/post_controller.dart';
import 'detail_post_views.dart';

class PostViewPage extends GetView<PostController>{

  @override
  PostController controller = Get.find();

  PostWaitingController postWaitingController = Get.find();

  PostModel post = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkAccentColor,
        title: Text("Chi tiết bài viết",style: FontUtils.font18w500(),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(AppConst.defaultPadding),
            decoration: const BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.all(Radius.circular(AppDimens.sizeCircular)),
            ),
            child: DetailPost(post,postWaitingController)
          ).paddingOnly(top: 20,left: 15,right: 15),
        ),
      ),
    );
  }



}