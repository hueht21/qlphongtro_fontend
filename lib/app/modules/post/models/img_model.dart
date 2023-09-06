class MyDataLinkImg {
  final String webViewLink;

  MyDataLinkImg({required this.webViewLink});

  factory MyDataLinkImg.fromJson(Map<String, dynamic> json) {
    return MyDataLinkImg(
      webViewLink: json['webContentLink'],
    );
  }
}