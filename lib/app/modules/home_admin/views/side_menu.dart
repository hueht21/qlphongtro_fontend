import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qlphongtro/app/modules/home_admin/controllers/home_admin_controller.dart';
import 'package:qlphongtro/app/routes/app_pages.dart';

class SideMenu extends GetView<HomeAdminController> {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () {
              controller.router.value = "/";
              Get.back();
            },
          ),
          DrawerListTile(
            title: "Quản lý bài viết",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {
              controller.isManagePost.value = !controller.isManagePost.value;
            },
          ),
          Obx(() => controller.isManagePost.value
              ? Column(
                  children: [
                    DrawerListTile(
                      title: "Bài viết",
                      svgSrc: "assets/icons/menu_task.svg",
                      press: () {
                        controller.router.value = Routes.VIEW_WAITING_POST;
                        Get.back();
                      },
                    ).paddingOnly(left: 20),
                    DrawerListTile(
                      title: "Documents",
                      svgSrc: "assets/icons/menu_doc.svg",
                      press: () {},
                    ).paddingOnly(left: 20),
                  ],
                ).paddingOnly(left: 20)
              : SizedBox()),

          // DrawerListTile(
          //   title: "Store",
          //   svgSrc: "assets/icons/menu_store.svg",
          //   press: () {},
          // ),
          // DrawerListTile(
          //   title: "Notification",
          //   svgSrc: "assets/icons/menu_notification.svg",
          //   press: () {},
          // ),
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
          DrawerListTile(
            title: "Tài khoản nhân viên",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {
              controller.router.value = "/accout_personnal";
              Get.back();
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
