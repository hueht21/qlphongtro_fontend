import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:qlphongtro/app/core/utils/font_utils.dart';
import 'package:qlphongtro/app/modules/recharge/controllers/recharge_controller.dart';

import '../../../core/values/colors.dart';

class RechargeView extends GetView<RechargeController>{

  @override
  RechargeController controller = Get.put(RechargeController());
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkAccentColor,
        title: const Text("Nạp tiền"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15,),
              Card(
                color: AppColors.darkAccentColor,
                child: Column(
                  children: [
                    const SizedBox(height: 15,),
                    Text("Tìm kiếm khách hàng", style: FontUtils.font14W500(),),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: controller.textEmail,
                      decoration: const InputDecoration(
                        border:  OutlineInputBorder(),
                        hintText: "Nhập email khách hàng"
                      ),
                    ),

                    SizedBox(
                      width: Get.width - 20,
                        child: ElevatedButton(onPressed: () async{

                          await controller.getUserBank(controller.textEmail.text);
                        }, child: Text("Tìm kiếm"))).paddingOnly(top: 15),
                    const SizedBox(height: 15,),
                  ],
                ),
              ),
              const SizedBox(height: 15,),
              Obx(()
               => LoadingOverlayPro(
                  isLoading: controller.isLoadingOverlay.value,
                  child: controller.isShowUserBank.value ? _buildUserBank() : SizedBox(),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserBank(){
    return Column(
      children: [
        Card(
          color: AppColors.darkAccentColor,
          child: Column(
            children: [
              Text("Thông tin khách hàng",style: FontUtils.font14W500(),),
              const SizedBox(height: 15,),
              Row(
                children: [
                  Text("Tên khách hàng : ", style: FontUtils.font14W500(),),
                  const SizedBox(width: 10,),
                  Text(controller.rechargeDto.nameUser ?? "", style: FontUtils.font14W500(),),
                ],
              ),
              const SizedBox(height: 15,),
              Row(
                children: [
                  Text("Email : ", style: FontUtils.font14W500(),),
                  const SizedBox(width: 10,),
                  Text(controller.rechargeDto.email ?? "", style: FontUtils.font14W500(),),
                ],
              ),
              const SizedBox(height: 15,),
              Row(
                children: [
                  Text("Số dư ví :", style: FontUtils.font14W500(),),
                  const SizedBox(width: 10,),
                  Text("${controller.rechargeDto.bankAcount ?? 0.0}")
                ],
              )
            ],
          ).paddingSymmetric(horizontal: 20,vertical: 20),
        ),
        Card(
          color: AppColors.darkAccentColor,
          child: Column(
            children: [
              const SizedBox(height: 15,),
              Text("Số tiền cần nạp", style: FontUtils.font14W500(),),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controller.textMoney,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border:  OutlineInputBorder(),
                    hintText: "Nhập số tiền"
                ),
              ),

              SizedBox(
                  width: Get.width - 20,
                  child: ElevatedButton(onPressed: () async {
                    double total = (controller.rechargeDto.bankAcount?? 0) + double.parse(controller.textMoney.text);
                     await controller.updateUserBank(controller.rechargeDto.id ?? 0, total);
                  }, child: const Text("Nạp"))).paddingOnly(top: 15),
              const SizedBox(height: 15,),
            ],
          ),
        )
      ],
    );
  }


}