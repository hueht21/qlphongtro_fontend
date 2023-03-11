
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlphongtro/app/modules/home_admin/controllers/home_admin_controller.dart';
import 'package:qlphongtro/app/modules/home_admin/views/side_menu.dart';

import '../../../core/base/responsive.dart';
import 'dashboard_screen.dart';

class HomeAdminPage extends GetView<HomeAdminController>{

  @override
  HomeAdminController get controller => Get.put(HomeAdminController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: const SideMenu(),
      key: controller.scaffoldKey,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              const Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardScreen(), // chỗ này là những lựa chọn
            ),
          ],
        ),
      ),
    );
  }

}