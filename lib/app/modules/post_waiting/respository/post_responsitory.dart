import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:qlphongtro/app/core/base/base_request.dart';
import 'package:qlphongtro/app/core/base/base_responsitory.dart';

import '../../../core/values/const.dart';
import '../models/post_model.dart';
import '../models/post_result.dart';

class PostReponsitory extends BaseRepository{
  PostReponsitory(super.controller);

  Future<List<PostModel>> getPostResponsitory(int page) async {
    List<PostModel> listPostModel = [];
    var responsitory = await baseSendRquest("${AppConst.getPostAll}?pageNumber=$page&pageSize=9", RequestMethod.GET);
    PostResult postResult = PostResult.fromJson(responsitory);
    for(int i=0;i<postResult.postResponses.length;i++){
      PostModel postModelResult = postResult.postResponses[i];
      if(postModelResult.thumbnail == null || postModelResult.thumbnail ==""){

        postModelResult.thumbnail = "";
      }else{
        List<dynamic> jsonList = jsonDecode(postModelResult.thumbnail ?? "");
        Map<String, dynamic> firstJson = jsonList[0];
        String webContentLink = firstJson['webContentLink'];
        postModelResult.thumbnail = webContentLink;
      }

      listPostModel.add(postModelResult);
    }
    return listPostModel;

  }



}