import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:neurist_mobile/data/data_sources/remote/member_remote_data_source.dart';
import 'package:neurist_mobile/data/repositories/member_repository_impl.dart';
import 'package:neurist_mobile/domain/repositories/member_repository.dart';
import 'package:neurist_mobile/domain/use_cases/fetch_member_use_case.dart';
import 'package:neurist_mobile/presentation/blocs/member_bloc/member_bloc.dart';

/// Initialize sl as a service locator.
final sl = GetIt.instance;

/// Initialize all setup service locator.
Future<void> init() async {
  // bloc
  // registering service locator for [MemberBloc].
  sl.registerFactory(() => MemberBloc(fetchMemberUseCase: sl()));

  // usecases
  // registering service locator for [FetchMemberUseCase].
  sl.registerLazySingleton(() => FetchMemberUseCase(memberRepository: sl()));

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
}
