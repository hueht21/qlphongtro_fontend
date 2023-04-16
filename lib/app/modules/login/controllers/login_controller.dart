import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qlphongtro/app/core/base/base_controlers.dart';

import '../../../routes/app_pages.dart';
import '../../home_admin/repository/user_role_repository.dart';
import '../models/login_model.dart';

class LoginController extends BaseGetxController{


  late LoginResult loginResult;

  TextEditingController textEmail = TextEditingController(text: "phamngochue127@gmail.com");

  TextEditingController textPass = TextEditingController(text: "123456");

  Future<void> getUserRole(String email, String pass) async {
    showLoadingOverlay();
    loginResult = await UserRoleRepository(this).getUserRole(email, pass);

    hideLoadingOverlay();
    if(loginResult.code ==200){
      Get.offAllNamed(Routes.HOME, arguments: loginResult.userDtoModel);
    }
    // log("${userRole.fullName}");
  }


}