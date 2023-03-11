part of "login_page.dart";

Widget viewBuildInput() {
  return Column(
    children: [
      Text("Log in", style: FontUtils.font16W600().copyWith(fontSize: 25))
          .paddingOnly(top: 15),
      const SizedBox(
        height: 15,
      ),
      Row(
        children: [
          _viewSocialNetwork(
              title: "Google", img: "assets/icons/logo_google.svg"),
          _viewSocialNetwork(
              title: "Facebook", img: "assets/icons/logo_facebook.svg"),
        ],
      ),
      const SizedBox(
        height: 25,
      ),
      Row(
        children: [
          Expanded(
              child: BaseWidget.buildDriver(
                  color: Colors.white, width: 135, height: 0.5)),
          const Text("Or").paddingSymmetric(horizontal: 8),
          Expanded(
              child: BaseWidget.buildDriver(
                  color: Colors.white, width: 135, height: 0.5)),
        ],
      ).paddingSymmetric(horizontal: 12),
      _inputLogin()
    ],
  );
}

Widget _inputLogin() {
  return Column(
    children: [
      Text(
        "Địa chỉ Email",
        style: FontUtils.font16W700().copyWith(fontWeight: FontWeight.w400),
      ),
      Container(
        decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(10)),
        child:  const TextField(

        ),
      ),
    ],
  ).paddingSymmetric(horizontal: 12);
}

Widget _viewSocialNetwork({required String title, required String img}) {
  return Expanded(
    child: Container(
      width: 135,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(img),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: FontUtils.font15W400(),
          )
        ],
      ),
    ).paddingOnly(right: 15, left: 6),
  );
}
