class UserBankResult {
  UserBankResult({
    required this.code,
    required this.message,
    required this.rechargeDto,
  });

  final int? code;
  final String? message;
  final RechargeDto? rechargeDto;

  factory UserBankResult.fromJson(Map<String, dynamic> json){
    return UserBankResult(
      code: json["code"],
      message: json["message"],
      rechargeDto: json["rechargeDTO"] == null ? null : RechargeDto.fromJson(json["rechargeDTO"]),
    );
  }

}

class RechargeDto {

  RechargeDto({
    required this.id,
    required this.nameUser,
    required this.email,
    required this.bankAcount,
  });

   int? id;
   String? nameUser;
   String? email;
   double? bankAcount;

  factory RechargeDto.fromJson(Map<String, dynamic> json){
    return RechargeDto(
      id: json["id"],
      nameUser: json["nameUser"],
      email: json["email"],
      bankAcount: json["bank_acount"],
    );
  }

}
