import 'package:dartz/dartz.dart';
import 'package:test_module/core/errors/failed.dart';
import 'package:test_module/core/usecase/usecase.dart';
import 'package:test_module/feature/flic/data/model/flick_data.dart';
import 'package:test_module/feature/flic/domain/repository/flic_repository.dart';

class GetFlicImagesUseCase implements UseCase<FlickrData, GetFlicParams> {
  final FlicRepository repository;

  GetFlicImagesUseCase({required this.repository});

  @override
  Future<Either<Failure, FlickrData>> call(params) async {
    return await repository.getFlicApi(params: params);
  }
}

class GetFlicParams {
  String method;
  int index;

  GetFlicParams({required this.method,required this.index});
  Map<String, dynamic> toJson() => {
        "method": method,
        "index": index
      };
}
