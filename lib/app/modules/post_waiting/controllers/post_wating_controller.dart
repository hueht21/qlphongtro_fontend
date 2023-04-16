import 'package:get/get.dart';

import '../../../core/base/base_controlers.dart';
import '../models/post_model.dart';
import '../respository/post_responsitory.dart';
import '../models/post.dart';

class PostWaitingController extends BaseGetxController{


  RxList listPostModel = [].obs;

  @override
  onInit() async {
    super.onInit();
    listPostModel.value = await PostReponsitory(this).getPostResponsitory();
  }


  RxInt isTap = 0.obs;

  RxInt numberPage = 1.obs;

  List<int> listNunberPage = [1,2,3];

  List<Post> listPostWaiting = [

    Post(id: 0, poster: "Đặng Thuỳ Linh", title: "Phòng trọ Triều khúc", shortDescription: "Phòng trọ dành cho 2 người", dateSubmitt: "12/04/2023", numberDate: 5, status: 0),
    Post(id: 1, poster: "Nguyễn Văn Nam", title: "Phòng trọ Phùng Khoang", shortDescription: "Phòng trọ dành cho 2 người", dateSubmitt: "12/04/2023", numberDate: 5, status: 1),
    Post(id: 2, poster: "Nguyễn Văn Nam", title: "Phòng trọ Phùng Khoang", shortDescription: "Phòng trọ dành cho 2 người", dateSubmitt: "12/04/2023", numberDate: 5, status: 1),

  ];

}