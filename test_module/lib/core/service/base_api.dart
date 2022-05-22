import 'package:dio/dio.dart';
import 'package:test_module/core/service/api.dart';
import 'package:test_module/ultis/flavor_config.dart';

abstract class BaseApi {
  late final Api _apiClient;

  /// [identityBaseUrl] use for refreshing token later
  ///
  BaseApi(String baseUrl,
      {String? identityBaseUrl,
      bool disableRequestBodyLogging = false,
      bool ignoreToken = false,
      bool ignoreConnection = false}) {
    final dio = Dio();
    // dio.interceptors
    //     .add(CurlLogInterceptor(disableRequestBody: disableRequestBodyLogging));
    final accessToken = FlavorConfig.instance.getTestToken();
    dio.options.contentType = Headers.jsonContentType;
    dio.options.headers.addAll(<String, String>{
      'Authorization': accessToken,
      'App-version-Code': '350'
    });
    _apiClient = Api(dio, baseUrl: baseUrl);
  }

  Api get apiClient => _apiClient;
}
