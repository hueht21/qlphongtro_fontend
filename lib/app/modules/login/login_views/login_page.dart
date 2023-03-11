import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qlphongtro/app/core/utils/string_img.dart';

import '../../../core/base/responsive.dart';
import '../../../core/base/widget/base_widget.dart';
import '../../../core/utils/font_utils.dart';

part 'login_view.dart';

class LoginPage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: _buildInput()),
          if (Responsive.isDesktop(context) || Responsive.isTablet(context))
            Expanded(
                flex: 4,
                child: _viewImg())
        ],
      ),
    ));
  }

  Widget _buildInput() {
    return Container(
      color: const Color(0xff364153),
      child: Column(
        children: [
          Image.asset(AppImg.logo),
          viewBuildInput()
        ],
      ).paddingOnly(top: Get.height * 0.2),
    );
  }

  Widget _viewImg() {
    return Center(
      child: Image.asset(AppImg.logoView),
    );
  }
}
