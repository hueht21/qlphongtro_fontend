part of "login_page.dart";

Widget viewBuildInput(LoginController loginController) {
  return Column(
    children: [
      Text(AppStr.login, style: FontUtils.font16W600().copyWith(fontSize: AppDimens.sizeText))
          .paddingOnly(top: AppDimens.maginTop),
      const SizedBox(
        height: AppDimens.maginTop,
      ),
      Row(
        children: [
          _viewSocialNetwork(
              title: AppStr.google, img: AppSvg.logoGoogle),
          _viewSocialNetwork(
              title: AppStr.facebook, img: AppSvg.logoFacebook),
        ],
      ),
      Row(
        children: [
          Expanded(
              child: BaseWidget.buildDriver(
                  color: Colors.white, width: AppDimens.widthDrivier, height: AppDimens.heightDrivier)),
          const Text(AppStr.or).paddingSymmetric(horizontal: AppDimens.paddingHor),
          Expanded(
              child: BaseWidget.buildDriver(
                  color: Colors.white, width: AppDimens.widthDrivier, height: AppDimens.heightDrivier)),
        ],
      ).paddingSymmetric(horizontal: AppDimens.paddingDriver, vertical: AppDimens.sizeText),
      _inputLogin(title: AppStr.addressEmail, textEditingController: loginController.textEmail),
      _inputLogin(title: AppStr.passWord, textEditingController: loginController.textPass, isPass: true),
      InkWell(
        onTap: (){
          loginController.getUserRole(loginController.textEmail.text, loginController.textPass.text);

        },
        child: Container(
          height: AppDimens.heigthBotton,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimens.sizeCircular),
            color: AppColors.darkBootomColor
          ),
            child: Center(
              child: Text(AppStr.login,style: FontUtils.font15W400(),),
            )).paddingSymmetric(horizontal: AppDimens.paddingDriver,vertical: AppDimens.sizeText),
      )
    ],
  );
}

Widget _inputLogin({required String title, required TextEditingController textEditingController, bool isPass = false}) {
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
        decoration: BoxDecoration(
            color: AppColors.coloBlack, borderRadius: BorderRadius.circular(AppDimens.sizeCircular)),
        child: TextField(
          obscureText: isPass,
          controller: textEditingController,
          decoration: const InputDecoration(enabledBorder: InputBorder.none),
        ),
      ),
    ],
  ).paddingSymmetric(horizontal: AppDimens.paddingDriver, vertical: AppDimens.paddingDriver);
}

Widget _viewSocialNetwork({required String title, required String img}) {
  return Expanded(
    child: Container(
      width: AppDimens.widthDrivier,
      height: AppDimens.heigthBotton,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(AppDimens.paddingDriver)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(img),
          const SizedBox(
            width: AppDimens.sizeCircular,
          ),
          Text(
            title,
            style: FontUtils.font15W400(),
          )
        ],
      ),
    ).paddingOnly(right: AppDimens.maginTop, left: AppDimens.sizeSmall),
  );
}
