import 'package:get/get.dart';

import '../../../core/base/base_controlers.dart';
import '../models/post_model.dart';
import '../models/post_result.dart';
import '../respository/post_responsitory.dart';
import '../models/post.dart';

class PostWaitingController extends BaseGetxController{


  RxList<PostModel> listPostModel = <PostModel>[].obs;

  RxList<PostModel> listPostModelSearch = <PostModel>[].obs;


  @override
  onInit() async {
    super.onInit();
    await setListPostModel();
  }

  Future<void> setListPostModel() async {
    listPostModel.value = await PostReponsitory(this).getPostResponsitory();
    listPostModelSearch = listPostModel;
  }


  RxInt isTap = 0.obs;

  RxInt numberPage = 1.obs;

  List<int> listNunberPage = [1,2,3];

}