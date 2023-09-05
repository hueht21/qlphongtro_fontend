import 'package:qlphongtro/app/modules/post_waiting/models/post_model.dart';

class PostResult {
  PostResult({
    required this.totalPage,
    required this.pageNumber,
    required this.pageSize,
    required this.searchRequest,
    required this.postResponses,
  });

  final int? totalPage;
  final int? pageNumber;
  final int? pageSize;
  final String? searchRequest;
  final List<PostModel> postResponses;

  factory PostResult.fromJson(Map<String, dynamic> json){
    return PostResult(
      totalPage: json["totalPage"],
      pageNumber: json["pageNumber"],
      pageSize: json["pageSize"],
      searchRequest: json["searchRequest"],
      postResponses: json["postResponses"] == null ? [] : List<PostModel>.from(json["postResponses"]!.map((x) => PostModel.fromJson(x))),
    );
  }

}
