import 'package:test_module/core/service/base_api.dart';
import 'package:test_module/core/shared/data/datasource/remote_datasource.dart';
import 'package:test_module/feature/flic/data/model/flick_data.dart';
import 'package:test_module/feature/flic/domain/usecase/get_flic_images.dart';
import 'package:test_module/ultis/constants.dart';

class RemoteDataSourceImpl extends BaseApi implements RemoteDataSource {
  RemoteDataSourceImpl({required String baseUrl}) : super(baseUrl);

  @override
  Future<FlickrData> getFlicApi({required GetFlicParams params}) async {
    return await apiClient.getFlicApi(
      apiKey: Constants.API_KEY,
      method: params.method,
      page: params.index,
    );
  }
}
