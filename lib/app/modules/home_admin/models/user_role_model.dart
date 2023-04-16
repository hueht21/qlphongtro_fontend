class UserRole {
  UserRole({
    required this.id,
    required this.email,
    required this.fullName,
    required this.listRole,
  });


  int? id;
  String? email;
  String? fullName;
  List<ListRole> listRole;

  factory UserRole.fromJson(Map<String, dynamic> json){
    return UserRole(
      id: json["id"],
      email: json["email"],
      fullName: json["fullName"],
      listRole: json["listRole"] == null ? [] : List<ListRole>.from(json["listRole"]!.map((x) => ListRole.fromJson(x))),
    );
  }

}

class ListRole {
  ListRole({
    required this.idRole,
    required this.nameRole,
  });

  int? idRole;
  String? nameRole;

  factory ListRole.fromJson(Map<String, dynamic> json){
    return ListRole(
      idRole: json["idRole"],
      nameRole: json["nameRole"],
    );
  }

}
