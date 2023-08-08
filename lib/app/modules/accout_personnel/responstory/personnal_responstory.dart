import 'dart:developer';

import 'package:qlphongtro/app/core/base/base_request.dart';
import 'package:qlphongtro/app/core/base/base_responsitory.dart';
import 'package:qlphongtro/app/modules/accout_personnel/models/personnal_model.dart';

class PersonnalRespon extends BaseRepository{
  PersonnalRespon(super.controller);

  Future<List<PersonnalModel>> getResponstoryPerson() async {
    List<PersonnalModel> listPersonnal = [];
    var listResult = await baseSendRquest("/personnal/get-personanl", RequestMethod.GET);
    // for(int i = 0;i < listResult.length ;i++){
    //
    //   listPersonnal.add(PersonnalModel.fromJson(listResult[i]));
    //
    // }
    List<PersonnalModel> personalList = List<PersonnalModel>.from(listResult.map((json) => PersonnalModel.fromJson(json)));
    log("${ personalList.toString()}");
    return personalList;
  }

}