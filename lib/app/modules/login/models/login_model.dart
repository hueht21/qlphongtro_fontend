import '../../home_admin/models/user_role_model.dart';

class LoginResult {
  LoginResult({
    required this.code,
    required this.messent,
    required this.userDtoModel,
  });

  final int? code;
  final String? messent;
  final UserRole? userDtoModel;

  factory LoginResult.fromJson(Map<String, dynamic> json){
    return LoginResult(
      code: json["code"],
      messent: json["messent"],
      userDtoModel: json["userDtoModel"] == null ? null : UserRole.fromJson(json["userDtoModel"]),
    );
  }

}

// class UserDtoModel {
//   UserDtoModel({
//     required this.id,
//     required this.email,
//     required this.fullName,
//     required this.listRole,
//   });
//
//   final int? id;
//   final String? email;
//   final String? fullName;
//   final List<ListRole> listRole;
//
//   factory UserDtoModel.fromJson(Map<String, dynamic> json){
//     return UserDtoModel(
//       id: json["id"],
//       email: json["email"],
//       fullName: json["fullName"],
//       listRole: json["listRole"] == null ? [] : List<ListRole>.from(json["listRole"]!.map((x) => ListRole.fromJson(x))),
//     );
//   }
//
// }
//
// class ListRole {
//   ListRole({
//     required this.idRole,
//     required this.nameRole,
//   });
//
//   final int? idRole;
//   final String? nameRole;
//
//   factory ListRole.fromJson(Map<String, dynamic> json){
//     return ListRole(
//       idRole: json["idRole"],
//       nameRole: json["nameRole"],
//     );
//   }
//
// }
