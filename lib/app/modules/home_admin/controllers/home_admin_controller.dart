import 'package:flutter/material.dart';
import 'package:qlphongtro/app/core/base/base_controlers.dart';

class HomeAdminController extends BaseGetxController{

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen ) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }


}