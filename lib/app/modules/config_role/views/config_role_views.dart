import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlphongtro/app/core/base/responsive.dart';
import 'package:qlphongtro/app/core/base/widget/base_widget.dart';

import '../../../core/utils/font_utils.dart';
import '../../../core/utils/string_img.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/const.dart';
import '../../../core/values/dimens.dart';
import '../../../core/values/string_values.dart';
import 'config_account_role_view.dart';

class ConfigRolePage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppStr.listAcc,
          style: FontUtils.font18w500(),
        ),
        BaseWidget.sizeBoxHeight(10),
        _buildListAccount(),
        BaseWidget.sizeBoxHeight(5),
        if(Responsive.isMobile(context))...[
          ConfigAccRolePage()
        ],
        // ConfigAccRolePage()
      ],
    );
  }

  String valueRadio= '';

  Widget _buildListAccount() {
    return Container(
      width: Get.width * 0.6,
      padding: const EdgeInsets.all(AppConst.defaultPadding),
      decoration: const BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius:
              BorderRadius.all(Radius.circular(AppDimens.sizeCircular))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildItemAcc(),
          BaseWidget.sizeBoxHeight(10),
          _buildItemAcc()
        ],
      ),
    );
  }

  Widget _buildItemAcc(){
    return Row(
      children: [
        Radio(value:false, groupValue: valueRadio, onChanged: (value) {

        }),
        Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
            ),
            child: Image.asset(AppImg.account)).paddingOnly(right: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Phạm Văn Hà", style: FontUtils.font16W600()),
            BaseWidget.sizeBoxHeight(3),
            Text("phamvanha234@gmail.com", style: FontUtils.font14W500()),
          ],
        )
      ],
    );
  }

}
