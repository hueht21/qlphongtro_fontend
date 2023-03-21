part of 'accout_personnal_infor.dart';

Widget _buildHeaderInfo() {
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
    Text("Phạm Ngọc Huế",
        style: FontUtils.font18w500().copyWith(fontSize: AppDimens.fontSize)),
    const SizedBox(height: AppConst.defaultPadding - AppDimens.sizeSmall),
    Text("${AppStr.position}: Admin", style: FontUtils.font14()),
    const SizedBox(height: AppConst.defaultPadding),
    BaseWidget.buildDriver(
        color: AppColors.colorWhite, width: Get.width, height: AppDimens.sizeDriver),
  ]);
}

Widget _buildContactInfo() {
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
            _itemContact(title: "phamngochue127@gmail.com", icons: Icons.mail),
            const SizedBox(
              height: AppConst.defaultPadding,
            ),
            _itemContact(title: "0376248911", icons: Icons.phone),
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
      Center(
        child: Image.asset(AppImg.upAccout),
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
