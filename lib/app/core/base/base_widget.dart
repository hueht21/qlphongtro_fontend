import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:qlphongtro/app/core/base/widget/base_widget.dart';

import 'base_controlers.dart';

abstract class BaseGetWidget<T extends BaseGetxController> extends GetView<T>{

  const BaseGetWidget({Key? key}) : super(key: key);

  Widget buildWidgets();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // tắt tính năng vuốt trái để back lại màn hình trước đó trên iphone
      onWillPop: () async {
        // KeyBoard.hide();
        // await 300.milliseconds.delay();
        return !Navigator.of(context).userGestureInProgress;
      },
      child: buildWidgets(),
    );
  }

  Widget baseShowLoading(WidgetCallback child) {
    return Obx(
          () => controller.isShowLoading.value
          ? const Center(child: BaseWidget.buildLoading)
          : child(),
    );
  }

}