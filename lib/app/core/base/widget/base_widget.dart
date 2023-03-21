import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/platform/platform.dart';

import '../../../modules/accout_personnel/controllers/accout_personnal_controller.dart';
import '../../../modules/accout_personnel/views/accout_personnel_page.dart';
import '../../values/colors.dart';
import '../../values/const.dart';
import '../../values/dimens.dart';
import '../../values/string_values.dart';

class BaseWidget {

  static DateTime? _dateTime;
  static int _oldFunc = 0;

  static const Widget buildLoading = CupertinoActivityIndicator();

  static Widget buildDriver(
      {required Color color, required double width, required double height}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
      ),
    );
  }

  static Widget baseOnAction({
    required Function onTap,
    required Widget child,
  }) {
    return GestureDetector(
      onTap: () {
        DateTime now = DateTime.now();
        if (_dateTime == null ||
            now.difference(_dateTime ?? DateTime.now()) > 1.seconds ||
            onTap.hashCode != _oldFunc) {
          _dateTime = now;
          _oldFunc = onTap.hashCode;
          onTap();
        }
      },
      child: child,
    );
  }



  static Widget buildListPersonnal(AccoutPersonnalController controller) {
    return Container(
      padding: const EdgeInsets.all(AppConst.defaultPadding),
      decoration: const BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(AppDimens.sizeCircular)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStr.listAccPer,
            style: Theme.of(Get.context!).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: AppConst.defaultPadding,
              minWidth: AppDimens.minWidthTab,
              columns: const [
                DataColumn(
                  label: Text(AppStr.nameAcc),
                ),
                DataColumn(
                  label: Text(AppStr.nameLogin),
                ),
                DataColumn(
                  label: Text(AppStr.phone),
                ),
                DataColumn(
                  label: Text(AppStr.position),
                ),
                DataColumn(
                  label: Center(child: Text(AppStr.function)),
                ),
              ],
              rows: List.generate(
                controller.listAcc.length,
                    (index) => recentFileDataRow(controller.listAcc[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
