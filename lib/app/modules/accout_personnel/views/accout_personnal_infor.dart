import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlphongtro/app/core/base/widget/base_widget.dart';
import 'package:qlphongtro/app/core/utils/font_utils.dart';
import 'package:qlphongtro/app/core/values/dimens.dart';

import '../../../core/utils/string_img.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/const.dart';
import '../../../core/values/string_values.dart';
import '../controllers/accout_personnal_controller.dart';

part 'personnal_info_view.dart';

class AccoutPersonnalInfor {
  // AccoutPersonnalController controller;

  Widget AccoutPersonnalInforr(AccoutPersonnalController controller) {
    return Container(
      padding: const EdgeInsets.all(AppConst.defaultPadding),
      decoration: const BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildHeaderInfo(controller),
          const SizedBox(height: AppConst.defaultPadding),
          _buildContactInfo(controller),
        ],
      ),
    );
  }

}
