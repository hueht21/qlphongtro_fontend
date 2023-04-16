
import 'package:qlphongtro/app/core/values/const.dart';
import '../../../core/base/base_request.dart';
import '../../../core/base/base_responsitory.dart';
import '../../login/models/login_model.dart';
import '../models/user_role_model.dart';

// class UserRoleRepository extends BaseRepository {
//   UserRoleRepository(super.controller);
//
//   Future<UserRole> getUserRole(int id) async{
//
//     var response = await baseSendRquest(AppConst.getUserRole(1), RequestMethod.GET);
//     return UserRole.fromJson(response);
//   }
//
//
// }

class UserRoleRepository extends BaseRepository {
  UserRoleRepository(super.controller);

  Future<LoginResult> getUserRole(String email, String pass) async{

    var response = await baseSendRquest(AppConst.getUserRole, RequestMethod.POST, jsonMap: {"email" : email, "pass" : pass});
    return LoginResult.fromJson(response);
  }


}