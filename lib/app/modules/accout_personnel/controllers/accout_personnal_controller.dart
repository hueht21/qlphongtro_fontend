import 'package:qlphongtro/app/modules/accout_personnel/models/accout_personnal_model.dart';

import '../../../core/base/base_controlers.dart';

class AccoutPersonnalController extends BaseGetxController {
  List listAcc = [
    AccoutPersonnal(
        nameAccout: "Phạm Ngọc Huế",
        nameLogin: "huepn127@gmail.com",
        phone: "0345862155",
        position: "Admin"),
    AccoutPersonnal(
        nameAccout: "Nguyễn Phương Anh",
        nameLogin: "phuonganh089@gmail.com",
        phone: "0345812455",
        position: "Nhân viên"),
    AccoutPersonnal(
        nameAccout: "Nguyễn Văn Hùng",
        nameLogin: "hung1287@gmail.com",
        phone: "0345812455",
        position: "Nhân viên"),
  ];
}
