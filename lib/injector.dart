import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:neurist_mobile/data/data_sources/remote/device_remote_data_source.dart';
import 'package:neurist_mobile/data/repositories/device_repository_impl.dart';
import 'package:neurist_mobile/domain/repositories/device_repository.dart';
import 'package:neurist_mobile/domain/use_cases/fetch_device_use_case.dart';
import 'package:neurist_mobile/domain/use_cases/delete_device_use_case.dart';
import 'package:neurist_mobile/presentation/blocs/device_bloc/device_bloc.dart';

/// Import Member Utility
import 'package:neurist_mobile/data/data_sources/remote/member_remote_data_source.dart';
import 'package:neurist_mobile/data/repositories/member_repository_impl.dart';
import 'package:neurist_mobile/domain/repositories/member_repository.dart';
import 'package:neurist_mobile/domain/use_cases/fetch_member_use_case.dart';
// import 'package:neurist_mobile/domain/use_cases/delete_member_use_case.dart';
import 'package:neurist_mobile/presentation/blocs/member_bloc/member_bloc.dart';

/// Import Member Utility
import 'package:neurist_mobile/data/data_sources/remote/service_remote_data_source.dart';
import 'package:neurist_mobile/data/repositories/service_repository_impl.dart';
import 'package:neurist_mobile/domain/repositories/service_repository.dart';
import 'package:neurist_mobile/domain/use_cases/fetch_service_use_case.dart';
// import 'package:neurist_mobile/domain/use_cases/delete_service_use_case.dart';
import 'package:neurist_mobile/presentation/blocs/service_bloc/service_bloc.dart';

/// Initialize sl as a service locator.
final sl = GetIt.instance;

/// Initialize all setup service locator.
Future<void> init() async {
  // bloc
  // registering service locator for [DeviceBloc].
  sl.registerFactory(
      () => DeviceBloc(fetchDeviceUseCase: sl(), deleteDeviceUseCase: sl()));

  // usecases
  // registering service locator for [FetchDeviceUseCase].
  sl.registerLazySingleton(() => FetchDeviceUseCase(deviceRepository: sl()));

  // registering service locator for [DeleteDeviceUseCase].
  sl.registerLazySingleton(() => DeleteDeviceUseCase(deviceRepository: sl()));

  // repositories
  // registering service locator for [DeviceRepository].
  sl.registerLazySingleton<DeviceRepository>(
      () => DeviceRepositoryImpl(deviceRemoteDataSource: sl()));

  // datasources
  // registering service locator for [DeviceRemoteDataSource].
  sl.registerLazySingleton<DeviceRemoteDataSource>(
      () => DeviceRemoteDataSourceImpl(dio: sl()));

  /////////////////////////////////////////////////////////////////////////////////////////////////
  ///
  ///
  ///
  ///
  ///
  // Member part
  // registering service locator for [MemberBloc].
  sl.registerFactory(() => MemberBloc(fetchMemberUseCase: sl()));

  // usecases
  // registering service locator for [FetchMemberUseCase].
  sl.registerLazySingleton(() => FetchMemberUseCase(memberRepository: sl()));

  // registering service locator for [DeleteMemberUseCase].
  // sl.registerLazySingleton(() => DeleteMemberUseCase(memberRepository: sl()));

  // repositories
  // registering service locator for [MemberRepository].
  sl.registerLazySingleton<MemberRepository>(
      () => MemberRepositoryImpl(memberRemoteDataSource: sl()));

  // datasources
  // registering service locator for [MemberRemoteDataSource].
  sl.registerLazySingleton<MemberRemoteDataSource>(
      () => MemberRemoteDataSourceImpl(dio: sl()));

  // external
  // registering service locator for [Dio()].
  sl.registerLazySingleton(() => Dio());

  /////////////////////////////////////////////////////////////////////////////////////////////////
  ///
  ///
  ///
  ///
  ///
  // Service part
  // registering service locator for [ServiceBloc].
  sl.registerFactory(
      () => ServiceBloc(fetchServiceUseCase: sl(), deleteServiceUseCase: sl()));

  // usecases
  // registering service locator for [FetchServiceUseCase].
  sl.registerLazySingleton(() => FetchServiceUseCase(serviceRepository: sl()));

  // registering service locator for [DeleteServiceUseCase].
  // sl.registerLazySingleton(() => DeleteServiceUseCase(serviceRepository: sl()));

  // repositories
  // registering service locator for [ServiceRepository].
  sl.registerLazySingleton<ServiceRepository>(
      () => ServiceRepositoryImpl(serviceRemoteDataSource: sl()));

  // datasources
  // registering service locator for [ServiceRemoteDataSource].
  sl.registerLazySingleton<ServiceRemoteDataSource>(
      () => ServiceRemoteDataSourceImpl(dio: sl()));
}
