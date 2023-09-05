import 'package:qlphongtro/app/core/base/base_request.dart';
import 'package:qlphongtro/app/core/base/base_responsitory.dart';

import '../models/post_status_model.dart';

class PostStatusResponstory extends BaseRepository{
  PostStatusResponstory(super.controller);

  Future<String> getResponPost(PostStatus postStatus) async{

    String status = await baseSendRquest("/post/update-post", RequestMethod.POST, jsonMap: {"idPost" : postStatus.idPost, "status" : postStatus.status, "idUser": postStatus.idUser});
    return status;
  }

}