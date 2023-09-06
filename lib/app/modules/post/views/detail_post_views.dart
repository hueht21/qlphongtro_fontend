import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:qlphongtro/app/core/values/string_values.dart';
import 'package:qlphongtro/app/modules/post_waiting/models/post_model.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../../core/base/date_utils.dart';
import '../../../core/base/widget/base_widget.dart';
import '../../../core/utils/font_utils.dart';
import '../../../core/utils/string_img.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/dimens.dart';
import '../../post_waiting/controllers/post_wating_controller.dart';
import '../controllers/post_controller.dart';

class DetailPost extends GetView<PostController> {
  DetailPost(this.post, this.postWaitingController, {super.key});

  PostWaitingController postWaitingController;
  PostModel post;

  NumberFormat currencyFormat = NumberFormat('#,##0', 'vi_VN');

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlayPro(
        isLoading: controller.isLoadingOverlay.value,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 40, height: 40, child: Image.asset(AppImg.account)),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.userResponse?.fullName ?? "",
                      style: FontUtils.font14W500(),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      formatDateTimeToString(post.createdAt ?? DateTime.now()),
                      style: FontUtils.font12W500(),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "${post.title}",
              style: FontUtils.font18w500(),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "${post.content}",
              style: FontUtils.font14W500(),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tên chủ trọ : ",
                  style: FontUtils.font14W500(),
                ),
                Expanded(
                    child: Text(
                  "${post.areaResponse!.name}",
                  style: FontUtils.font14W500(),
                )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Địa chỉ : ",
                  style: FontUtils.font14W500(),
                ),
                Expanded(
                    child: Text(
                  "${post.areaResponse!.exactAddress}",
                  style: FontUtils.font14W500(),
                )),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tình trạng : ",
                  style: FontUtils.font14W500(),
                ),
                Expanded(
                    child: Text(
                  post.status == 0
                      ? AppStr.waiting
                      : (post.status == 2 ? "Hết hạn" : AppStr.approve),
                  style: FontUtils.font14W500(),
                )),
              ],
            ),
            for (int i = 0;
                i < controller.post.areaResponse!.roomResponses.length;
                i++) ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                          "Tên phòng: ${controller.post.areaResponse!.roomResponses[i].name}"),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  AutoSizeText(
                      "Miêu tả: ${controller.post.areaResponse!.roomResponses[i].description}"),
                  SizedBox(
                    height: 3,
                  ),
                  AutoSizeText(
                      "Tiền điện: ${currencyFormat.format(controller.post.areaResponse!.roomResponses[i].electricService)} VND"),
                  SizedBox(
                    height: 3,
                  ),
                  AutoSizeText(
                      "Tiền nước: ${currencyFormat.format(controller.post.areaResponse!.roomResponses[i].waterService)} VND"),
                  SizedBox(
                    height: 3,
                  ),
                  AutoSizeText(
                      "Giá phòng: ${currencyFormat.format(controller.post.areaResponse!.roomResponses[i].rentPrice)} VND"),
                ],
              ),
            ],
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Chi tiết ảnh các phòng"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Ảnh tiêu đề"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 200,
              width: Get.width - 20,
              child: CachedNetworkImage(
                imageUrl: "${post.thumbnail}",
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            for (int i = 0; i < controller.listImgConvert.length; i++) ...[
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 200,
                width: Get.width - 20,
                child: CachedNetworkImage(
                  imageUrl: controller.listImgConvert[i],
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ],
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
              QuickAlert.show(
                context: Get.context!,
                type: QuickAlertType.loading,
                title: 'Loading',
                text: 'Yêu cầu đang được gửi',
              );
              await controller.getPostStatus(
                  post.id ?? 0, post.userResponse!.id ?? 0, 2);
              Get.back();
              QuickAlert.show(
                  context: Get.context!,
                  type: QuickAlertType.success,
                  text: 'Hoành thành khoá bài',
                  confirmBtnColor: AppColors.darkAccentColor,
                  onConfirmBtnTap: () {
                    Get.back();
                    Get.back();
                  });
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
              if (controller.post.status == 1) {
                QuickAlert.show(
                  context: Get.context!,
                  type: QuickAlertType.error,
                  text: "Bạn đã duyệt bài này",
                  confirmBtnColor: AppColors.darkAccentColor,
                );
              } else {
                QuickAlert.show(
                  context: Get.context!,
                  type: QuickAlertType.loading,
                  title: 'Loading',
                  text: 'Yêu cầu đang được gửi',
                );
                await controller.getPostStatus(
                    post.id ?? 0, post.userResponse!.id ?? 0, 1);
                Get.back();
                QuickAlert.show(
                    context: Get.context!,
                    type: QuickAlertType.success,
                    text: 'Hoành thành phê duyệt',
                    confirmBtnColor: AppColors.darkAccentColor,
                    onConfirmBtnTap: () {
                      Get.back();
                      Get.back();
                    });
              }



              // await postWaitingController.setListPostModel();
              // Get.back();
            },
          ),
        ),
      ],
    ).paddingSymmetric(vertical: AppDimens.paddingSmall);
  }
}
