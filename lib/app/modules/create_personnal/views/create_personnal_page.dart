import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:qlphongtro/app/core/base/responsive.dart';
import 'package:qlphongtro/app/core/base/widget/base_widget.dart';
import 'package:qlphongtro/app/core/utils/string_img.dart';
import 'package:qlphongtro/app/core/values/colors.dart';
import 'package:qlphongtro/app/core/values/dimens.dart';
import 'package:qlphongtro/app/core/values/string_values.dart';

import '../../../core/utils/font_utils.dart';
import '../../accout_personnel/controllers/accout_personnal_controller.dart';

part 'create_personnal_view.dart';

class CreateAccPersonnal extends GetView<AccoutPersonnalController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkAccentColor,
        centerTitle: true,
        title: const Text(AppStr.createAcc),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: AppDimens.sizeFlex, child: _viewFormCreate(context)),
            if (!Responsive.isMobile(context))
              Expanded(
                  flex: AppDimens.sizeFlex,
                  child: BaseWidget.buildListPersonnal(controller)
                      .paddingOnly(top: AppDimens.btnMedium, right: AppDimens.btnMedium))
          ],
        ),
      )),
    );
  }
}
