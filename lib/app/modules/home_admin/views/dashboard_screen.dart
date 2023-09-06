import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:qlphongtro/app/core/utils/string_img.dart';
import 'package:qlphongtro/app/modules/home_admin/controllers/home_admin_controller.dart';
import 'package:qlphongtro/app/modules/home_admin/views/recent_files.dart';
import 'package:qlphongtro/app/modules/home_admin/views/storage_details.dart';
import 'package:qlphongtro/app/routes/app_pages.dart';

import '../../../core/values/constan.dart';
import '../../../core/base/responsive.dart';
import '../../accout_personnel/views/accout_personnal_infor.dart';
import '../../accout_personnel/views/accout_personnel_page.dart';
import '../../article_statistics/article_statistics_views/my_fields.dart';
import '../../config_role/views/config_account_role_view.dart';
import '../../config_role/views/config_role_views.dart';
import '../../post_waiting/views/post_waiting_page.dart';
import 'header.dart';

class DashboardScreen extends GetView<HomeAdminController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: defaultPadding),
            Obx(
              () => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (controller.router.value == Routes.HOME_DASHBOARD) ...[
                    Expanded(
                      flex: 5,
                      child: _viewMyfile(), // các view chỉnh ở đây
                    ),
                  ] else if (controller.router.value ==
                      Routes.ACCOUT_PERSONNAL) ...[
                        Expanded(
                      flex: 5,
                      child: AccoutPersonnalPage(), // các view chỉnh ở đây
                    ),
                  ] else if (controller.router.value ==
                      Routes.VIEW_WAITING_POST) ...[
                    Expanded(flex: 5, child: PostWaitingPage())
                  ] else if (controller.router.value ==
                      Routes.CONFIG_ROLE) ...[
                    Expanded(flex: 4, child: ConfigRolePage())
                  ],

                  ////

                  if (!Responsive.isMobile(context))
                    const SizedBox(width: defaultPadding),
                  if (!Responsive.isMobile(context)) ...[
                    /////
                    if (controller.router.value == Routes.HOME_DASHBOARD) ...[
                      const Expanded(
                        flex: 2,
                        child: StarageDetails(),
                      ),
                    ] else if (controller.router.value ==
                        Routes.ACCOUT_PERSONNAL) ...[
                       // Expanded(
                       //  flex: 2,
                       //  child: AccoutPersonnalInfor(),
                      //),
                    ]else if (controller.router.value ==
                        Routes.CONFIG_ROLE) ...[
                      Expanded(flex: 3, child: ConfigAccRolePage())
                    ],

                    ////
                  ]
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _pageMyfile(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: _viewMyfile(), // các view chỉnh ở đây
        ),
        if (!Responsive.isMobile(context))
          const SizedBox(width: defaultPadding),
        const Expanded(
          flex: 2,
          child: StarageDetails(),
        ),
      ],
    );
  }

  Widget _viewMyfile() {
    return Column(
      children: [

        SizedBox(
          width: Get.width - 20,
          height: 700,
          child: InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse('https://trofstack-production.up.railway.app/?fbclid=IwAR0YL3YYoNxnwjQdD6X8v_7c5FIOVZda2mmcuKgO_zkU1XoCN66xGOxvCEs')),
          ),
        ),
        // Image.asset(AppImg.logo)
        // const MyFiles(),
        // const SizedBox(height: defaultPadding),
        // const RecentFiles(),
        // if (Responsive.isMobile(Get.context!))
        //   const SizedBox(height: defaultPadding),
        // if (Responsive.isMobile(Get.context!)) const StarageDetails(),
      ],
    );
  }

  Widget _accoutPresonnal() {
    return Column(
      children: [
        const MyFiles(),
        Container(
          height: 160,
          width: Get.width,
          child: AccoutPersonnalPage(),
        ),
        const SizedBox(height: defaultPadding),
        // const RecentFiles(),
        if (Responsive.isMobile(Get.context!))
          const SizedBox(height: defaultPadding),
        if (Responsive.isMobile(Get.context!)) const StarageDetails(),
      ],
    );
  }
}
