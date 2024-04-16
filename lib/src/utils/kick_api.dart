import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class KickApi {
  static Future<int?> getChannelId(
    String username,
  ) async {
    Response response;
    var dio = Dio();

    try {
      dio.options.headers['User-Agent'] = 'Chrome/51.0.2704.64 Safari/537.36';
      response = await dio.get(
        "https://kick.com/api/v2/channels/$username",
      );
      return response.data['id'];
    } on DioException catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
