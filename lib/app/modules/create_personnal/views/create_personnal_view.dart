part of 'create_personnal_page.dart';

Widget _viewFormCreate(BuildContext context) {
  return Container(
    width: Get.width * AppDimens.widthForm,
    decoration: BoxDecoration(
        color: AppColors.darkAccentColor,
        borderRadius: BorderRadius.circular(AppDimens.sizeCircular)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: AppDimens.sizeText,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              AppStr.createAcc,
              style: FontUtils.font18w500(),
            ),
          ],
        ),
        const SizedBox(
          height: AppDimens.sizeText,
        ),
        Image.asset(AppImg.create_img),
        if (Responsive.isDesktop(context)) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: _buildInput(title: AppStr.fullName)),
              const SizedBox(
                width: AppDimens.sizeCircularBig,
              ),
              Expanded(child: _buildInput(title: AppStr.email)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: _buildInput(title: AppStr.fullName)),
              const SizedBox(
                width: AppDimens.sizeCircularBig,
              ),
              Expanded(child: _buildInput(title: AppStr.email)),
            ],
          ),
          _buildViewButtom(isSpaceBetween: true),
        ] else ...[
          _buildInput(title: AppStr.fullName),
          _buildInput(title: AppStr.email),
          _buildInput(title: AppStr.phoneNumber),
          _buildInput(title: AppStr.idCard),
          _buildViewButtom(),
        ],
      ],
    ).paddingSymmetric(horizontal: AppDimens.sizeText),
  ).paddingSymmetric(
      vertical: AppDimens.btnMedium, horizontal: AppDimens.sizeText);
}

Widget _buildViewButtom({bool isSpaceBetween = false}) {
  return Row(
    mainAxisAlignment: isSpaceBetween
        ? MainAxisAlignment.spaceBetween
        : MainAxisAlignment.center,
    children: [
      _buildButtom(title: AppStr.cancelCreate, isType: true),
      const SizedBox(
        width: AppDimens.paddingDriver,
      ),
      _buildButtom(title: AppStr.create),
    ],
  ).paddingSymmetric(
      horizontal: AppDimens.paddingDriver, vertical: AppDimens.paddingDriver);
}

Widget _buildButtom({required String title, bool isType = false}) {
  return Container(
    width: AppDimens.sizeImgWidth,
    height: AppDimens.heightButtom,
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.darkBootomColor),
        borderRadius: BorderRadius.circular(AppDimens.sizeCircular),
        color: isType ? AppColors.darkAccentColor : AppColors.darkBootomColor),
    child: Center(
      child: Text(title),
    ),
  );
}

Widget _buildInput({required String title}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: FontUtils.font16W700().copyWith(fontWeight: FontWeight.w400),
      ),
      const SizedBox(
        height: AppDimens.maginTop,
      ),
      Container(
        width: AppDimens.widthInput,
        height: AppDimens.heigthBotton,
        decoration: BoxDecoration(
            color: AppColors.coloBlack,
            borderRadius: BorderRadius.circular(AppDimens.sizeCircular)),
        child: const TextField(
          decoration: InputDecoration(enabledBorder: InputBorder.none),
        ).paddingOnly(left: AppDimens.fontSize),
      ),
    ],
  ).paddingSymmetric(
      horizontal: AppDimens.paddingDriver, vertical: AppDimens.paddingDriver);
}
