import 'package:neurist_mobile/data/models/service_model.dart';

abstract class ServiceRepository {
  Future<List<ServiceModel>> fetch();
  // Future<List<ServiceModel>> get({
  //   int? serviceId,
  //   String? serviceName,
  //   String? serviceAddress,
  //   String? servicePhone,
  // });
  Future<bool> delete({required int serviceId});
}
