import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'base_controlers.dart';
import 'base_request.dart';

class BaseRepository {
  final BaseRequest _baseRequest = Get.put(BaseRequest());
  final BaseGetxController controller;

  BaseRepository(this.controller);

  /// [isQueryParametersPost]: `true`: phương thức post gửi params, mặc định = `false`
  ///
  /// [dioOptions]: option của Dio() sử dụng khi gọi api có option riêng
  ///
  /// [functionError]: chạy function riêng khi request xảy ra Exception (mặc định sử dụng [showDialogError])
  Future<dynamic> baseSendRquest(
      String action,
      RequestMethod requestMethod, {
        dynamic jsonMap,
        bool isDownload = false,
        String? urlOther,
        Map<String, String>? headersUrlOther,
        bool isQueryParametersPost = false,
        BaseOptions? dioOptions,
        Function(Object error)? functionError,
      }) {
    return _baseRequest.sendRequest(
      action,
      requestMethod,
      jsonMap: jsonMap,
      isDownload: isDownload,
      urlOther: urlOther,
      headersUrlOther: headersUrlOther,
      isQueryParametersPost: isQueryParametersPost,
      controller: controller,
      dioOptions: dioOptions,
      functionError: functionError,
    );
  }
}
