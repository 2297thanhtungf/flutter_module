import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:test_module/ultis/constants.dart';

enum RequestMethod { POST, GET, DELETE }

class BaseRequest {
  static Dio _dio = Dio();
  static final _singleton = BaseRequest._internal();

  factory BaseRequest() {
    _dio.interceptors.add(
        DioCacheManager(CacheConfig(defaultRequestMethod: "GET")).interceptor);
    bool _showLogDio = false; // Khi nào cần thì bật lên
    // nhiều log quá bug k phát hiện được.
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90));
    return _singleton;

    // if (_dio == null) {
    //   // _dio = Dio();
    //   _dio.options.connectTimeout = 60000;
    //   _dio.interceptors.add(
    //       DioCacheManager(CacheConfig(defaultRequestMethod: "GET"))
    //           .interceptor);
    //   bool _showLogDio = false; // Khi nào cần thì bật lên
    //   // nhiều log quá bug k phát hiện được.
    //     _dio.interceptors.add(PrettyDioLogger(
    //         requestHeader: true,
    //         requestBody: true,
    //         responseBody: true,
    //         responseHeader: true,
    //         error: true,
    //         compact: true,
    //         maxWidth: 90));
    // }
    // return _singleton;
  }

  BaseRequest._internal();

  /// `useCache` not support method POST,
  /// Default = false
  /// forceRefreshCache default = true, get before data from network, if error use cache.
  Future<dynamic> sendRequest(String path, RequestMethod requestMethod,
      {required String customDomain,
      dynamic jsonMap,
      dynamic queryParams,
      bool useCache = false,
      int cacheMaxDay = 3,
      int maxStale = 7,
      bool forceRefreshCache = true,
      bool shouldEncrypt = false}) async {
   late Response response;

    _dio.options.baseUrl = customDomain ;

    if (requestMethod == RequestMethod.POST) {
      response = await _dio.post(
        path,
        data: jsonMap,
        queryParameters: queryParams,
        // options: Options(
        //     headers: await _getBaseHeader(shouldEncrypt: shouldEncrypt)),
      );
    } else if (requestMethod == RequestMethod.GET) {
      response = await _dio.get(
        path,
        // options: useCache
        //     ? buildCacheOptions(Duration(days: cacheMaxDay),
        //         forceRefresh: forceRefreshCache,
        //         options: Options(
        //             headers:
        //                 await _getBaseHeader(shouldEncrypt: shouldEncrypt)),
        //         maxStale: Duration(days: maxStale))
        //     : Options(
        //         headers: await _getBaseHeader(shouldEncrypt: shouldEncrypt)),
        queryParameters: queryParams,
      );
    } else if (requestMethod == RequestMethod.DELETE) {
      response = await _dio.delete(
        path,
        options:  buildCacheOptions(Duration(days: cacheMaxDay),
                forceRefresh: forceRefreshCache,
                maxStale: Duration(days: maxStale))
            ,
        queryParameters: queryParams,
      );
    }
    return response.data;
  }

  void lockRequest() {
    _dio.lock();
  }

  void unlockRequest() {
    _dio.unlock();
  }

}
