import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:qlphongtro/app/core/base/widget/base_widget.dart';
import 'package:qlphongtro/app/core/base/widget/show_popup.dart';
import 'package:qlphongtro/app/core/values/dimens.dart';
import 'package:qlphongtro/app/modules/accout_personnel/controllers/accout_personnal_controller.dart';
import 'package:qlphongtro/app/modules/accout_personnel/models/accout_personnal_model.dart';
import 'package:qlphongtro/app/modules/accout_personnel/models/personnal_model.dart';
import 'package:qlphongtro/app/modules/accout_personnel/views/accout_personnal_infor.dart';

import '../../../core/base/responsive.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/const.dart';
import '../../../core/values/string_values.dart';
import '../../../routes/app_pages.dart';

part 'accout_personnal_view.dart';

class AccoutPersonnalPage extends GetView<AccoutPersonnalController> {

  @override
  AccoutPersonnalController controller = Get.find();


  @override
  Widget build(BuildContext context) {
    return Obx(()
      => LoadingOverlayPro(
        isLoading: controller.isLoadingOverlay.value,
        child: Column(
          children:  [
            _viewTitleOption(),
            const SizedBox(height: AppConst.defaultPadding),
            // _buildListPersonnal(controller),
            _buildListPersonnal(controller),
            if (Responsive.isMobile(context))
              const SizedBox(height: AppConst.defaultPadding),
            if (Responsive.isMobile(context)) ...[
              AccoutPersonnalInfor().AccoutPersonnalInforr(controller),
            ],

          ],
        ),
      ),
    );
  }
}
