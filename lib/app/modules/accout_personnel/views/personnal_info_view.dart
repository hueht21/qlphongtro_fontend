part of 'accout_personnal_infor.dart';

Widget _buildHeaderInfo(AccoutPersonnalController acc) {
  return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
    Text(
      AppStr.inforAccout,
      style: FontUtils.font18w500(),
    ),
    const SizedBox(height: AppConst.defaultPadding),
    Container(
      height: AppDimens.sizeImgHeight,
      width: AppDimens.sizeImgWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.sizeCircularBig)),
      child: Image.asset(AppImg.logoView),
    ),
    const SizedBox(height: AppConst.defaultPadding),
    Obx(() => Text(acc.personnalModel.value.fullName ?? "",
          style: FontUtils.font18w500().copyWith(fontSize: AppDimens.fontSize)),
    ),
    const SizedBox(height: AppConst.defaultPadding - AppDimens.sizeSmall),
    Obx(()=> Text("${AppStr.position}: ${acc.personnalModel.value.nameRole}", style: FontUtils.font14())),
    const SizedBox(height: AppConst.defaultPadding),
    BaseWidget.buildDriver(
        color: AppColors.colorWhite, width: Get.width, height: AppDimens.sizeDriver),
  ]);
}

Widget _buildContactInfo(AccoutPersonnalController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(AppStr.inforContact,
          style: FontUtils.font18w500().copyWith(fontSize: AppDimens.fontSize)),
      const SizedBox(
        height: AppConst.defaultPadding,
      ),
      SizedBox(
        width: 270,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(()=> _itemContact(title: controller.personnalModel.value.email ??"", icons: Icons.mail)),
            const SizedBox(
              height: AppConst.defaultPadding,
            ),
            Obx(()=> _itemContact(title: controller.personnalModel.value.phoneNumber ??"", icons: Icons.phone)),
            const SizedBox(
              height: AppConst.defaultPadding,
            ),
            _itemContact(
                title: "Yên Thái - Yên Mô - Ninh Bình",
                icons: Icons.location_on_sharp),
            const SizedBox(
              height: AppConst.defaultPadding,
            ),
          ],
        ),
      ),
      InkWell(
        onTap: ()async {
          await controller.getListPersonnal();
        },
        child: Center(
          child: Image.asset(AppImg.upAccout),
        ),
      )
    ],
  );
}

Widget _itemContact({required String title, required IconData icons}) {
  return Row(
    children: [
      Icon(icons),
      const SizedBox(
        width: AppDimens.sizeCircular,
      ),
      Expanded(
        child: Text(title,
            style: FontUtils.font18w500().copyWith(fontSize: AppDimens.fontSize)),
      ),
    ],
  );
}
