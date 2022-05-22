import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart' as retrofit;
import 'package:test_module/feature/flic/data/model/flick_data.dart';
part 'api.g.dart';

@retrofit.RestApi()
abstract class Api {
  factory Api(Dio dio, {required String baseUrl}) = _Api;
  
  @retrofit.GET('')
  Future<FlickrData> getFlicApi({
    @retrofit.Query('?method') required String method,
    @retrofit.Query('api_key') required String apiKey,
    @retrofit.Query('page') required int page,
  });

}
