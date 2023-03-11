import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_utils/src/platform/platform.dart';

class BaseWidget {
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
}
