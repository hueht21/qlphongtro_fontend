
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlphongtro/app/application/app.dart';
import 'package:qlphongtro/app/modules/post/views/detail_post_views.dart';
import 'package:qlphongtro/app/modules/post_waiting/models/post.dart';
import 'package:qlphongtro/app/modules/post_waiting/models/post_model.dart';

import '../../../core/base/date_utils.dart';
import '../../../core/base/widget/show_popup.dart';
import '../../../core/utils/font_utils.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/const.dart';
import '../../../core/values/dimens.dart';
import '../../../core/values/string_values.dart';
import '../../../routes/app_pages.dart';
import '../controllers/post_wating_controller.dart';

class PostWaitingPage extends GetView<PostWaitingController> {

  @override
  PostWaitingController controller = Get.put(PostWaitingController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStr.listPost,
          style: FontUtils.font18w500(),
        ),
        const SizedBox(
          height: 20,
        ),
        _buildOption(),
        const SizedBox(
          height: 20,
        ),
        _buildListPost(),
        const SizedBox(
          height: 20,
        ),
        _buildPageStyles()
      ],
    );
  }

  Widget _buildPageStyles() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildPage(title: AppStr.before,isForward: false),
        const SizedBox(
          width: 10,
        ),
        for (int i in controller.listNunberPage) ...[
          Obx(() => _buildNumberPage(number: i)),
          const SizedBox(
            width: 10,
          )
        ],
        _buildPage(title: AppStr.next,isForward: true),
      ],
    );
  }

  Widget _buildPage({required String title, required bool isForward}) {
    return InkWell(
      onTap: () {
        if (isForward) {
          controller.numberPage >= controller.listNunberPage.length
              ? controller.numberPage
              : controller.numberPage++;
        } else {
          controller.numberPage <= controller.listNunberPage[0]
              ? controller.numberPage
              : controller.numberPage--;
        }
      },
      child: Container(
        height: 35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.darkLogin,
            border: Border.all(color: AppColors.hintTextColor)),
        child: Center(child: Text(title)).paddingSymmetric(horizontal: 10),
      ).paddingOnly(bottom: 10),
    );
  }

  Widget _buildNumberPage({required int number}) {
    bool isNumberPage = number == controller.numberPage.value;
    return InkWell(
      onTap: () {
        controller.numberPage.value = number;
      },
      child: Container(
        height: 35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
                isNumberPage ? AppColors.darkBootomColor : AppColors.darkLogin,
            border: Border.all(color: isNumberPage ? AppColors.darkBootomColor : AppColors.hintTextColor)),
        child: Center(child: Text("$number")).paddingSymmetric(horizontal: 10),
      ).paddingOnly(bottom: 10),
    );
  }

  Widget _buildOption() {
    return Row(
      children: [
        Obx(() => _viewOption(
            title: AppStr.all, isLeft: true, isRight: false, index: 0)),
        Obx(() => _viewOption(
            title: AppStr.notApprovedYet, isLeft: false, isRight: false, index: 1)),
        Obx(() => _viewOption(
            title: AppStr.approve, isLeft: false, isRight: false, index: 2)),
        Obx(() => _viewOption(
            title: AppStr.expired, isLeft: false, isRight: true, index: 3)),
      ],
    );
  }

  Widget _viewOption(
      {required String title,
      required bool isRight,
      required bool isLeft,
      required int index}) {
    bool isOnTap = index == controller.isTap.value;
    return InkWell(
      onTap: () {
        controller.isTap.value = index;
      },
      child: Container(
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(isLeft ? 10 : 0),
                  bottomLeft: Radius.circular(isLeft ? 10 : 0),
                  topRight: Radius.circular(isRight ? 10 : 0),
                  bottomRight: Radius.circular(isRight ? 10 : 0)),
              // border: Border.,
              color: isOnTap ? AppColors.darkBootomColor : const Color(0xff364153)),
          child: Center(child: Text(title)).paddingSymmetric(horizontal: 10)),
    );
  }

  Widget _buildListPost() {
    return Container(
      padding: const EdgeInsets.all(AppConst.defaultPadding),
      decoration: const BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(AppDimens.sizeCircular)),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Obx(()
          => DataTable2(
            showCheckboxColumn : false,
            columnSpacing: AppConst.defaultPadding,
            minWidth: 1000,
            columns: const [
              DataColumn2(
                size: ColumnSize.S,
                label: Text(AppStr.number),
              ),
              DataColumn(
                label: Text(AppStr.poster),
              ),
              DataColumn(
                label: Text(AppStr.title),
              ),
              // DataColumn(
              //   label: Text(AppStr.shortDescription),
              // ),
              DataColumn(
                label: Text(AppStr.datePost),
              ),
              DataColumn2(
                size: ColumnSize.S,
                label: Center(child: Text(AppStr.numberDate)),
              ),
              DataColumn(
                label: Center(child: Text(AppStr.status)),
              ),
            ],
            rows: List.generate(
              controller.listPostModel.length,
              (index) => recentFileDataRow(controller.listPostModel[index]),
            ),
          ),
        ),
      ),
    );
  }

  DataRow recentFileDataRow(PostModel post) {
    return DataRow(
      onSelectChanged: (bool? select){
        if(isMobile){
          Get.toNamed(Routes.VIEW_POST,arguments: post);
        }else{ // show pobop
          // ShowPopup.buildPostWeb(post: post,viewPost: DetailPost(post));

        }
    },
      cells: [
        DataCell(Text("${post.id}")),
        DataCell(Text("${post.userResponse!.fullName }")),
        DataCell(Text(post.title ?? "")),
        // DataCell(Text(post.shortDescription)),
        DataCell(Text(formatDateTimeToString(post.createdAt ?? DateTime.now()))),
        DataCell(Center(child: Text("${post.numberDate}"))),
        DataCell(Center(
          child: Container(
              decoration: BoxDecoration(
                  color: post.status == 0
                      ? AppColors.colorAccAd
                      : AppColors.colorAccPer,
                  borderRadius: BorderRadius.circular(AppDimens.paddingHor)),
              child: Text(post.status == 0 ? AppStr.waiting : AppStr.approve)
                  .paddingSymmetric(
                      horizontal: 10, vertical: AppDimens.sizeVerticalSmall)),
        )),
        // const DataCell(Center(child: Text("..."))),
      ],
    );
  }
}
