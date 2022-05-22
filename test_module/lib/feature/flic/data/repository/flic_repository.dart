import 'package:test_module/core/shared/data/datasource/remote_datasource.dart';
import 'package:test_module/feature/flic/data/model/flick_data.dart';
import 'package:test_module/core/errors/failed.dart';
import 'package:dartz/dartz.dart';
import 'package:test_module/feature/flic/domain/repository/flic_repository.dart';
import 'package:test_module/feature/flic/domain/usecase/get_flic_images.dart';
import 'package:test_module/ultis/mixin/connection_mixin.dart';

class FlicRepositoryImpl with ConnectivityMixin implements FlicRepository {
  RemoteDataSource remoteDataSource;

  FlicRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, FlickrData>> getFlicApi(
      {required GetFlicParams params}) async {
    if (await isInConnection()) {
      try {
        var res = await remoteDataSource.getFlicApi(params: params);
        return Right(res);

        /// handle left right
        // if (res.errorCode == 0) {
        //   return Right(res);
        // } else {
        //   return Left(Failure('Some thing went wrong'));
        // }
      } on Failure catch (error, strace) {
        print(strace);
        return Left(error);
      } catch (e, s) {
        print(s);
        return Left(Failure(e.toString()));
      }
    }
    return Left(NoConnection());
  }
}
