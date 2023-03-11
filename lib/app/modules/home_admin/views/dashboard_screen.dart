import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlphongtro/app/modules/home_admin/views/recent_files.dart';
import 'package:qlphongtro/app/modules/home_admin/views/storage_details.dart';

import '../../../core/values/constan.dart';
import '../../../core/base/responsive.dart';
import 'header.dart';
import '../../myfiles/myfiles_views/my_fields.dart';

class DashboardScreen extends StatelessWidget {
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: _viewMyfile(), // các view chỉnh ở đây
                ),
                if (!Responsive.isMobile(context))
                  const SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we dont want to show it
                if (!Responsive.isMobile(context))
                  const Expanded(
                    flex: 2,
                    child: StarageDetails(),
                  ),
              ],
            )
          ],
        ),
      ),
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
}
