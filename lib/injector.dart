import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:neurist_mobile/data/data_sources/remote/device_remote_data_source.dart';
import 'package:neurist_mobile/data/repositories/device_repository_impl.dart';
import 'package:neurist_mobile/domain/repositories/device_repository.dart';
import 'package:neurist_mobile/domain/use_cases/fetch_device_use_case.dart';
import 'package:neurist_mobile/presentation/blocs/device_bloc/device_bloc.dart';

/// Initialize sl as a service locator.
final sl = GetIt.instance;

/// Initialize all setup service locator.
Future<void> init() async {
  // bloc
  // registering service locator for [DeviceBloc].
  sl.registerFactory(() => DeviceBloc(fetchDeviceUseCase: sl()));

  // usecases
  // registering service locator for [FetchDeviceUseCase].
  sl.registerLazySingleton(() => FetchDeviceUseCase(deviceRepository: sl()));

  // repositories
  // registering service locator for [DeviceRepository].
  sl.registerLazySingleton<DeviceRepository>(
      () => DeviceRepositoryImpl(deviceRemoteDataSource: sl()));

  // datasources
  // registering service locator for [DeviceRemoteDataSource].
  sl.registerLazySingleton<DeviceRemoteDataSource>(
      () => DeviceRemoteDataSourceImpl(dio: sl()));

  // external
  // registering service locator for [Dio()].
  sl.registerLazySingleton(() => Dio());
}
