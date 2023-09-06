import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:qlphongtro/app/core/utils/string_img.dart';
import 'package:qlphongtro/app/core/utils/string_svg.dart';
import 'package:qlphongtro/app/core/values/dimens.dart';
import 'package:qlphongtro/app/modules/login/controllers/login_controller.dart';

import '../../../core/base/responsive.dart';
import '../../../core/base/widget/base_widget.dart';
import '../../../core/utils/font_utils.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/string_values.dart';
import '../../../routes/app_pages.dart';

part 'login_view.dart';

class LoginPage extends GetView<LoginController> {
  @override
  LoginController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => LoadingOverlayPro(
            isLoading: controller.isLoadingOverlay.value,
            child: Row(
              children: [
                Expanded(flex: 2, child: _buildInput()),
                if (Responsive.isDesktop(context) ||
                    Responsive.isTablet(context))
                  Expanded(flex: 4, child: _viewImg())
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInput() {
    return Container(
      height: Get.height,
      color: AppColors.darkLogin,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(AppImg.logo),
            viewBuildInput(controller),
          ],
        ).paddingOnly(top: Get.height * 0.15),
      ),
    );
  }

  Widget _viewImg() {
    return Center(
      child: Image.asset(AppImg.logoView),
    );
  }
}
