class PersonnalModel {
  PersonnalModel({
    required this.id,
    required this.email,
    required this.fullName,
    required this.bankAccount,
    required this.phoneNumber,
    required this.idRole,
    required this.nameRole,
  });

  // PersonnalModel();

   int? id;
   String? email;
   String? fullName;
   double? bankAccount;
   String? phoneNumber;
   int? idRole;
   String? nameRole;

  factory PersonnalModel.fromJson(Map<String, dynamic> json){
    return PersonnalModel(
      id: json["id"],
      email: json["email"],
      fullName: json["fullName"],
      bankAccount: json["bankAccount"],
      phoneNumber: json["phoneNumber"],
      idRole: json["idRole"],
      nameRole: json["nameRole"],
    );
  }

}
