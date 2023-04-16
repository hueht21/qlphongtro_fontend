import 'dart:convert';
import 'dart:developer';

import 'package:qlphongtro/app/core/base/base_request.dart';
import 'package:qlphongtro/app/core/base/base_responsitory.dart';

import '../../../core/values/const.dart';
import '../models/post_model.dart';

class PostReponsitory extends BaseRepository{
  PostReponsitory(super.controller);

  Future<List<PostModel>> getPostResponsitory() async {
    List<PostModel> listPostModel = [];
    var responsitory = await baseSendRquest(AppConst.getPostAll, RequestMethod.GET);
    responsitory.length;
    for(int i=0;i<responsitory.length;i++){

      PostModel postModelResult = PostModel.fromJson(responsitory[i]);
      // if(postModelResult.thumbnail != null){
      //
      // }
      List<dynamic> jsonList = jsonDecode(postModelResult.thumbnail ?? "");
      Map<String, dynamic> firstJson = jsonList[0];
      String webContentLink = firstJson['webContentLink'];
      postModelResult.thumbnail = webContentLink;
      listPostModel.add(postModelResult);
    }
    return listPostModel;

  }


}