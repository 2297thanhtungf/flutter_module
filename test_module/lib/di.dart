import 'package:get_it/get_it.dart';
import 'package:test_module/core/shared/data/datasource/remote_datasource.dart';
import 'package:test_module/core/shared/data/datasource/remote_datasource_impl.dart';
import 'package:test_module/feature/flic/domain/usecase/get_flic_images.dart';
import 'package:test_module/ultis/constants.dart';
import 'package:test_module/ultis/flavor_config.dart';

GetIt get = GetIt.instance;

void setupLocator() {
  /// use case
  get.registerLazySingleton(() => GetFlicImagesUseCase(repository: get()));

  /// Data sources
  get.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(baseUrl: Constants.BASE_URL));
}
