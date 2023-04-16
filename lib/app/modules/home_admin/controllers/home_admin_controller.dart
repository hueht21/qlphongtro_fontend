import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlphongtro/app/core/base/base_controlers.dart';
import 'package:qlphongtro/app/core/values/const.dart';

import '../../../application/app_controller.dart';
import '../../../routes/app_pages.dart';
import '../models/user_role_model.dart';
import '../repository/user_role_repository.dart';

class HomeAdminController extends BaseGetxController{

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  AppController appController = Get.find<AppController>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  RxString router = Routes.HOME_DASHBOARD.obs;

  RxBool isManagePost = false.obs;

  RxBool isAccount = false.obs;

  RxBool isRole = false.obs;
  
  late UserRole userRole ;


  @override
  void onInit() async {
    super.onInit();
    //await getUserRole();
    userRole = Get.arguments;
    checkRole();
  }


  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen ) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }



  void checkRole(){
    var map = <String, String>{};
    for(int i=0;i<userRole.listRole.length;i++){
      map[userRole.listRole[i].nameRole ?? ""] = userRole.listRole[i].nameRole ?? "";
    }
    if(map.keys.contains(AppConst.ADMIN_HT)){
      appController.isRoleMenu = 2;
      log("Admin he thong");
    }else if(map.keys.contains(AppConst.ADMIN)){
      appController.isRoleMenu = 1;
      log("Admin");
    }
  }


}