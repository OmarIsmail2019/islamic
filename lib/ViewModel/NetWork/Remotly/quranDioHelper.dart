import 'package:dio/dio.dart';
import 'package:muslim/constant/baseUrl.dart';

// ignore: camel_case_types
class quranNetWork {
  static late Dio dio;
  static late Dio adhanDio;

  static init() {
    dio = Dio(
        BaseOptions(baseUrl: quranBaseUrl, receiveDataWhenStatusError: true));
  }

  static Future<Response> getDataQuran(
      {required String url,}) async {
    return await dio.get(url);
  }

  static initAdhan() {
    adhanDio = Dio(BaseOptions(
        baseUrl: qibla_and_adhan_baseUrl, receiveDataWhenStatusError: true));
  }

  static Future<Response> getQiblaData(
      {required String url, Map<String, dynamic>? query}) async {
    try {
      final Response response = await adhanDio.get(
        url,
        queryParameters: query,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
// class qiblaNetWork {
//   static Dio? dio;
//
//   static init() {
//     dio = Dio(
//         BaseOptions(baseUrl: qibla_and_adhan_baseUrl, receiveDataWhenStatusError: true));
//   }
//
//   static Future<Response> getQiblaData(
//       {required String url, Map<String, dynamic>? query}) async {
//     try {
//       final Response response = await dio!.get(
//         url,
//         queryParameters: query,
//       );
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
