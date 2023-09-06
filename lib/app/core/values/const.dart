class AppConst{

  static const String urlBase =
      'https://trofstack-production.up.railway.app';

  static  String getUserRole = "/user-role/getUserRole";
  static  String updateUserBank(int id) => "/user-bank/update-bank-acount/$id";
  static String getUserBank = "/user-bank/get-user-bank";
  static String getPostAll = "/api/v1/rest/post";
  //base
  static const int pageSize = 10;
  static const int defaultPage = 1;
  static const int requestTimeOut = 15000 * 2; //ms

  static const double defaultPadding = 16.0;

  static const String ADMIN_HT = "ADMIN_HT";
  static const String ADMIN = "ADMIN";
}