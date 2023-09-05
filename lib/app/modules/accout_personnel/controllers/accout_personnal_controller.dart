import 'package:get/get.dart';
import 'package:qlphongtro/app/modules/accout_personnel/models/accout_personnal_model.dart';
import 'package:qlphongtro/app/modules/accout_personnel/models/personnal_model.dart';

import '../../../core/base/base_controlers.dart';
import '../responstory/personnal_responstory.dart';

class AccoutPersonnalController extends BaseGetxController {

  RxList listPersonnal = [].obs;
  Rx<PersonnalModel> personnalModel = PersonnalModel(id: 0, email: "", fullName: "", bankAccount: 0, phoneNumber: "", idRole: 0, nameRole: "").obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    showLoadingOverlay();
    await getListPersonnal();
    hideLoadingOverlay();
    if(listPersonnal.length >1) {
      personnalModel.value = listPersonnal[0];
    }

    super.onInit();
  }

  Future<void> getListPersonnal() async {
    listPersonnal.value = await PersonnalRespon(this).getResponstoryPerson();
  }



  //
  // List listAcc = [
  //   AccoutPersonnal(
  //       nameAccout: "Phạm Ngọc Huế",
  //       nameLogin: "huepn127@gmail.com",
  //       phone: "0345862155",
  //       position: "Admin"),
  //   AccoutPersonnal(
  //       nameAccout: "Nguyễn Phương Anh",
  //       nameLogin: "phuonganh089@gmail.com",
  //       phone: "0345812455",
  //       position: "Nhân viên"),
  //   AccoutPersonnal(
  //       nameAccout: "Nguyễn Văn Hùng",
  //       nameLogin: "hung1287@gmail.com",
  //       phone: "0345812455",
  //       position: "Nhân viên"),
  // ];
}
