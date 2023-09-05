import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/base/widget/base_widget.dart';
import '../../../core/utils/font_utils.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/const.dart';
import '../../../core/values/dimens.dart';
import '../../../core/values/string_values.dart';

class ConfigAccRolePage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
         AppStr.listRole,
          style: FontUtils.font18w500(),
        ),
        BaseWidget.sizeBoxHeight(5),
        _buildListRole()
      ],
    );
  }

  String valueRadio = '';

  Widget _buildListRole() {
    return Container(
      padding: const EdgeInsets.all(AppConst.defaultPadding),
      decoration: const BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius:
              BorderRadius.all(Radius.circular(AppDimens.sizeCircular))),
      child: Column(
        children: [
          _buildItemRole(),
          BaseWidget.sizeBoxHeight(10),
          _buildItemRole(),
          BaseWidget.sizeBoxHeight(10),
          _buildItemRole(),
        ],
      ),
    );
  }

  Widget _buildItemRole() {
    return Row(
      children: [
        Expanded(flex: 1,child: Checkbox(value: false, onChanged: (value) {})),
        BaseWidget.sizeBoxWidth(10),
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Admin hệ thống",
                style: FontUtils.font16W600(),
              ),
              const SizedBox(
                height: 5,
              ),
              AutoSizeText("Có các chức năng quản trị hệ thống",
                  style: FontUtils.font14W500()),
            ],
          ),
        )
      ],
    );
  }
}
