
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:qlphongtro/app/modules/post_waiting/models/post_model.dart';

import '../../../core/base/date_utils.dart';
import '../../../core/base/widget/base_widget.dart';
import '../../../core/utils/font_utils.dart';
import '../../../core/utils/string_img.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/dimens.dart';
import '../../post_waiting/controllers/post_wating_controller.dart';
import '../controllers/post_controller.dart';

class DetailPost extends GetView<PostController>{

  DetailPost(this.post, this.postWaitingController, {super.key});
  PostWaitingController postWaitingController;
  PostModel post;
  @override
  Widget build(BuildContext context) {
    return Obx(()
      => LoadingOverlayPro(
        isLoading: controller.isLoadingOverlay.value,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.asset(AppImg.account)),
                const SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(post.userResponse?.fullName ?? "", style: FontUtils.font14W500(),),
                    const SizedBox(height: 3,),
                    Text(formatDateTimeToString(post.createdAt ?? DateTime.now()), style: FontUtils.font12W500(),)
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Text("${post.title}", style: FontUtils.font18w500(),),
            const SizedBox(
              height: 20,
            ),
            Text("${post.content}", style: FontUtils.font14W500(),),
            const SizedBox(
              height: 20,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Tên chủ trọ : ", style: FontUtils.font14W500(),),
                Expanded(child: Text("${post.areaResponse!.name }", style: FontUtils.font14W500(),)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Địa chỉ : ", style: FontUtils.font14W500(),),
                Expanded(child: Text("${post.areaResponse!.exactAddress }", style: FontUtils.font14W500(),)),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Tình trạng : ", style: FontUtils.font14W500(),),
                Expanded(child: Text(post.status ==0 ? "Đang chờ" : "Đã duyệt", style: FontUtils.font14W500(),)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200,
              width: Get.width - 20,
              child: CachedNetworkImage(
                imageUrl : "${post.thumbnail}",
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            _buildBottomAction()
          ],
        ),
      ),
    );
  }
  Widget _buildBottomAction() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: BaseWidget.buildButton(
            "Khoá bài",
                () async {
                  await controller.getPostStatus(post.id ?? 0, post.userResponse!.id ?? 0, 2);
                  Get.back();
                },
            colors: AppColors.colorGradientGray,
          ),
        ),
        const SizedBox(width: AppDimens.paddingSmall),
        Expanded(
          flex: 1,
          child: BaseWidget.buildButton(
            "Phê duyệt",
                () async {
                 await controller.getPostStatus(post.id ?? 0, post.userResponse!.id ?? 0, 1);
                 // await postWaitingController.setListPostModel();
                 // Get.back();


            },
          ),
        ),
      ],
    ).paddingSymmetric(vertical: AppDimens.paddingSmall);
  }
}