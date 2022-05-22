
import 'package:test_module/feature/flic/data/model/flick_data.dart';
import 'package:test_module/feature/flic/domain/usecase/get_flic_images.dart';

abstract class RemoteDataSource {
  Future<FlickrData> getFlicApi({required GetFlicParams params});
}
