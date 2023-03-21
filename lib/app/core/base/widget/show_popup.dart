import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/font_utils.dart';
import '../../values/colors.dart';
import '../../values/dimens.dart';
import '../../values/string_values.dart';
import 'base_widget.dart';

class ShowPopup {
  static int _numDialog = 0;

  static void _showDialog(Widget dialog, bool isActiveBack,
      {bool barrierDismissible = false}) {
    _numDialog++;
    Get.dialog(
      WillPopScope(
        onWillPop: () => onBackPress(isActiveBack),
        child: dialog,
      ),
      barrierDismissible: barrierDismissible,
    ).whenComplete(() => _numDialog--);
  }


  static Future<bool> onBackPress(bool isActiveBack) {
    return Future.value(isActiveBack);
  }


  static void showDialogConfirm(
      String content, {
        required Function confirm,
        required String actionTitle,
        bool isActiveBack = true,
        String title = AppStr.notification,
        String exitTitle = AppStr.cancel,
        Function? cancelFunc,
        bool isAutoCloseDialog = false,
      }) {
    _showDialog(
        Dialog(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    title.tr,
                    textScaleFactor: 1,
                    maxLines: 1,
                    style: FontUtils.font18w500(),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15.0),
                  constraints: const BoxConstraints(maxHeight: 200),
                  child: SingleChildScrollView(
                    child: Text(
                      content.tr,
                      style: Get.textTheme.bodyText1
                          ?.copyWith(color: AppColors.coloBlack),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      textScaleFactor: 1,
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                Container(
                  width: double.infinity,
                  height: AppDimens.btnMedium,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: _baseButton(cancelFunc, exitTitle.tr,
                            colorText: AppColors.hintTextColor),
                      ),
                      const VerticalDivider(
                        width: 1,
                        color: AppColors.darkAccentColor,
                      ),
                      Expanded(
                        child: _baseButton(
                          confirm,
                          actionTitle.tr,
                          colorText: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        isActiveBack);
  }
  static Widget _baseButton(
      Function? function,
      String text, {
        Color? colorText,
      }) {
    return BaseWidget.baseOnAction(
        onTap: () {
          dismissDialog();

          function?.call();
        },
        child: TextButton(
          onPressed: null,
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: AppDimens.fontBig(),
              color: colorText ?? AppColors.coloBlack,
            ),
            textScaleFactor: 1,
            maxLines: 1,
          ),
        ));
  }

  static void dismissDialog() {
    if (_numDialog > 0) {
      Get.back();
    }
  }
}