import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/font_utils.dart';
import '../../../core/utils/string_img.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/const.dart';
import '../../../core/values/dimens.dart';

class ConfigRolePage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Danh sách tài khoản",
          style: FontUtils.font18w500(),
        ),
        _buildListAccount()
      ],
    );
  }

  String valueRadio= '';

  Widget _buildListAccount() {
    return Container(
      padding: const EdgeInsets.all(AppConst.defaultPadding),
      decoration: const BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius:
              BorderRadius.all(Radius.circular(AppDimens.sizeCircular))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Radio(value:false, groupValue: valueRadio, onChanged: (value) {

              }),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                  child: Image.asset(AppImg.logo)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Phạm Văn Hà"),
                  Text("phamvanha234@gmail.com"),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
