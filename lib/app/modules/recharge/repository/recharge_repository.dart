import '../../../core/base/base_request.dart';
import '../../../core/base/base_responsitory.dart';
import '../../../core/values/const.dart';
import '../model/recharge_model.dart';

class RechargeRepository extends BaseRepository{
  RechargeRepository(super.controller);



  Future<UserBankResult> getUserBankResult(String email) async{

    var userBankResult = await baseSendRquest(AppConst.getUserBank, RequestMethod.POST, jsonMap: {"email" :email});

    return UserBankResult.fromJson(userBankResult);
  }

  Future<UserBankResult> updateBankAcount(int id,double moneyBank) async {

    var userBankResult = await baseSendRquest(AppConst.updateUserBank(id), RequestMethod.POST, jsonMap: {"backAcount" :moneyBank});

    return UserBankResult.fromJson(userBankResult);
  }

}