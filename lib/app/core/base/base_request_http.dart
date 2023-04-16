// import 'package:qlphongtro/app/core/values/const.dart';
//
// import 'base_controlers.dart';
// import 'base_request.dart';
// import 'package:http/http.dart' as http;
//
// class BaseRequestHTTP {
//
//
//   Future<dynamic> sendRequest(String action, RequestMethod requestMethod,
//       {dynamic jsonMap,
//         String? urlOther,
//         Map<String, String>? headersUrlOther,
//         bool isQueryParametersPost = false,
//         Function(Object error)? functionError}) async {
//     var url = Uri.https(AppConst.urlBase, action);
//     var response = await http.post(url, body: jsonMap);
//     return response.body;
//
//
//   }
//
//
//   Future<dynamic> sendGetRequest(String action, RequestMethod requestMethod,
//       {dynamic jsonMap,
//         String? urlOther,
//         Map<String, String>? headersUrlOther,
//         bool isQueryParametersPost = false,
//         Function(Object error)? functionError}) async {
//     var actionn = "/user-role/getAllUserRole";
//
//     var uriii = Uri.parse("http://192.168.2.104:8080/user-role/getAllUserRole");
//     // var url = Uri.https(AppConst.urlBase, actionn);
//     var response = await http.get(uriii);
//     if(response.statusCode==200){
//       return response.body;
//     }else{
//       return null;
//     }
//   }
// }