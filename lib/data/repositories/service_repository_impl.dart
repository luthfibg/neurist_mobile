import 'package:neurist_mobile/data/data_sources/remote/service_remote_data_source.dart';
import 'package:neurist_mobile/data/models/service_model.dart';
import 'package:neurist_mobile/domain/repositories/service_repository.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  ServiceRepositoryImpl({required this.serviceRemoteDataSource});

  final ServiceRemoteDataSource serviceRemoteDataSource;

  @override
  Future<List<ServiceModel>> fetch() async {
    return await serviceRemoteDataSource.fetch();
  }

  // @override
  // Future<List<ServiceModel>> get({
  //   int? serviceId,
  //   String? serviceName,
  //   String? serviceAddress,
  //   String? servicePhone,
  // }) async {
  //   return await serviceRemoteDataSource.get(
  //       serviceId: serviceId, serviceName: serviceName, serviceAddress: serviceAddress, servicePhone: servicePhone);
  // }

  @override
  Future<bool> delete({required int serviceId}) async {
    return await serviceRemoteDataSource.delete(id: serviceId);
  }
}
