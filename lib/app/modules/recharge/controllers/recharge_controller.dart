import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlphongtro/app/core/base/base_controlers.dart';

import '../model/recharge_model.dart';
import '../repository/recharge_repository.dart';

class RechargeController extends BaseGetxController{

  RxBool isShowUserBank = false.obs;

  TextEditingController textEmail = TextEditingController();

  TextEditingController textMoney = TextEditingController();

  late RechargeDto rechargeDto;

  Future<void> getUserBank(String email) async{
    showLoadingOverlay();
    UserBankResult userBank = await RechargeRepository(this).getUserBankResult(email);
    if(userBank.code ==200){
      rechargeDto  = userBank.rechargeDto!;
      log("dđ");
      isShowUserBank.value = true;
    }
    hideLoadingOverlay();
  }

  Future<void> updateUserBank(int id, double moneyBank) async{
    showLoadingOverlay();
    UserBankResult userBank = await RechargeRepository(this).updateBankAcount(id,moneyBank);
    if(userBank.code ==200){
      rechargeDto  = userBank.rechargeDto!;
      log("dđ");
      isShowUserBank.value = true;
    }
    hideLoadingOverlay();
  }


}