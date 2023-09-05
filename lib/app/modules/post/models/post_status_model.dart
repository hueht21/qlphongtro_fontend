class PostStatus {
  PostStatus({
    required this.idUser,
    required this.idPost,
    required this.status,
  });

  final int? idUser;
  final int? idPost;
  final int? status;

  factory PostStatus.fromJson(Map<String, dynamic> json){
    return PostStatus(
      idUser: json["idUser"],
      idPost: json["idPost"],
      status: json["status"],
    );
  }

}
