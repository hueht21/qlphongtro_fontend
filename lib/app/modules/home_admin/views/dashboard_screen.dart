import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlphongtro/app/modules/home_admin/controllers/home_admin_controller.dart';
import 'package:qlphongtro/app/modules/home_admin/views/recent_files.dart';
import 'package:qlphongtro/app/modules/home_admin/views/storage_details.dart';
import 'package:qlphongtro/app/routes/app_pages.dart';

import '../../../core/values/constan.dart';
import '../../../core/base/responsive.dart';
import '../../accout_personnel/views/accout_personnal_infor.dart';
import '../../accout_personnel/views/accout_personnel_page.dart';
import '../../article_statistics/article_statistics_views/my_fields.dart';
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
                  if (controller.router.value == "/") ...[
                    Expanded(
                      flex: 5,
                      child: _viewMyfile(), // các view chỉnh ở đây
                    ),
                  ] else if (controller.router.value ==
                      "/accout_personnal") ...[
                    const Expanded(
                      flex: 5,
                      child: AccoutPersonnalPage(), // các view chỉnh ở đây
                    ),
                  ] else if (controller.router.value ==
                      "/view_post_waiting") ...[
                    Expanded(flex: 5, child: PostWaitingPage())
                  ] else if (controller.router.value ==
                      Routes.CONFIG_ROLE) ...[
                    Expanded(flex: 5, child: ConfigRolePage())
                  ],

                  ////

                  if (!Responsive.isMobile(context))
                    const SizedBox(width: defaultPadding),
                  if (!Responsive.isMobile(context)) ...[
                    /////
                    if (controller.router.value == "/") ...[
                      const Expanded(
                        flex: 2,
                        child: StarageDetails(),
                      ),
                    ] else if (controller.router.value ==
                        "/accout_personnal") ...[
                      const Expanded(
                        flex: 2,
                        child: AccoutPersonnalInfor(),
                      ),
                    ]

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
        const MyFiles(),
        const SizedBox(height: defaultPadding),
        const RecentFiles(),
        if (Responsive.isMobile(Get.context!))
          const SizedBox(height: defaultPadding),
        if (Responsive.isMobile(Get.context!)) const StarageDetails(),
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
          child: const AccoutPersonnalPage(),
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
