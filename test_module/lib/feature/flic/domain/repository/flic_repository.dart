import 'package:dartz/dartz.dart';
import 'package:test_module/core/errors/failed.dart';
import 'package:test_module/feature/flic/data/model/flick_data.dart';
import 'package:test_module/feature/flic/domain/usecase/get_flic_images.dart';

abstract class FlicRepository {
  Future<Either<Failure, FlickrData>> getFlicApi({required GetFlicParams params});
}
