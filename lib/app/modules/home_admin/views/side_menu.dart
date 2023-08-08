import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qlphongtro/app/core/utils/font_utils.dart';
import 'package:qlphongtro/app/core/utils/string_svg.dart';
import 'package:qlphongtro/app/core/values/const.dart';
import 'package:qlphongtro/app/modules/home_admin/controllers/home_admin_controller.dart';
import 'package:qlphongtro/app/routes/app_pages.dart';

import '../../../core/utils/string_img.dart';
import '../../../core/values/string_values.dart';
import '../../accout_personnel/controllers/accout_personnal_controller.dart';

class SideMenu extends GetView<HomeAdminController> {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          DrawerHeader(
            child: Column(
              children: [
                SizedBox(
                    height: 80, width: 80, child: Image.asset(AppImg.account)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${controller.userRole.fullName}",
                  style: FontUtils.font18w500(),
                ),
              ],
            ),
          ),
          DrawerListTile(
            title: AppStr.home,
            svgSrc: AppSvg.menuDashbord,
            press: () {
              controller.router.value = Routes.HOME_DASHBOARD;
              Get.back();
            },
          ),
          DrawerListTile(
            title: AppStr.postManagement,
            svgSrc: AppSvg.menuMangerPost,
            press: () {
              controller.isManagePost.value = !controller.isManagePost.value;
            },
          ),
          Obx(() => controller.isManagePost.value
              ? Column(
                  children: [
                    DrawerListTile(
                      title: AppStr.post,
                      svgSrc: AppSvg.menuPost,
                      press: () {
                        controller.router.value = Routes.VIEW_WAITING_POST;
                        Get.back();
                      },
                    ).paddingOnly(left: 20),
                    // DrawerListTile(
                    //   title: AppStr.post,
                    //   svgSrc: AppSvg.menuPost,
                    //   press: () {},
                    // ).paddingOnly(left: 20),
                  ],
                ).paddingOnly(left: 20)
              : const SizedBox()),

          if(controller.appController.isRoleMenu == 2)...[
            DrawerListTile(
              title: AppStr.manageSystem,
              svgSrc: AppSvg.menuSystem,
              press: () {
                controller.isRole.value = !controller.isRole.value;
              },
            ),
            Obx(() => controller.isRole.value
                ? Column(
              children: [
                DrawerListTile(
                  title: AppStr.manageRole,
                  svgSrc: AppSvg.menuPost,
                  press: () {
                    controller.router.value = Routes.CONFIG_ROLE;
                    Get.back();
                  },
                ).paddingOnly(left: 20),
                DrawerListTile(
                  title: AppStr.manageMenu,
                  svgSrc: AppSvg.menuPost,
                  press: () {},
                ).paddingOnly(left: 20),
              ],
            ).paddingOnly(left: 20)
                : const SizedBox()),
          ],


          DrawerListTile(
            title: "Nạp tiền",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () {
              Get.back();
              Get.toNamed(Routes.RECHARGE);
            },
          ),
          // DrawerListTile(
          //   title: "Profile",
          //   svgSrc: "assets/icons/menu_profile.svg",
          //   press: () {},
          // ),
          // DrawerListTile(
          //   title: "Settings",
          //   svgSrc: "assets/icons/menu_setting.svg",
          //   press: () {},
          // ),

          if(controller.appController.isRoleMenu == 2)...[
            DrawerListTile(
              title: AppStr.manageAcc,
              svgSrc: AppSvg.menuPost,
              press: () {
                AccoutPersonnalController con = Get.put(AccoutPersonnalController());
                controller.isAccount.value = !controller.isAccount.value;
              },
            ),
            Obx(() => controller.isAccount.value
                ? Column(
              children: [
                DrawerListTile(
                  title: AppStr.accoutPersonnal,
                  svgSrc: AppSvg.menuPost,
                  press: () {
                    controller.router.value = "/accout_personnal";

                    Get.back();
                  },
                ).paddingOnly(left: 20),
                DrawerListTile(
                  title: AppStr.manageMenu,
                  svgSrc: AppSvg.menuPost,
                  press: () {},
                ).paddingOnly(left: 20),
              ],
            ).paddingOnly(left: 20)
                : const SizedBox()),
          ],

          DrawerListTile(
            title: "Đăng xuất",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {
              Get.offAndToNamed(Routes.LOGIN);
            },
          ),

        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}
