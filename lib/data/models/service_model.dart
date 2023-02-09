import 'package:neurist_mobile/domain/entity/service_entity.dart';

/// Instance of class [ServiceEntity] which has the role of fetching and parsing data from/to json.
class ServiceModel extends ServiceEntity {
  /// Fetch data from json format.
  ServiceModel.fromJson(Map<String, dynamic> json)
      : super(
          serviceId: json['serviceId'],
          serviceName: json['serviceName'],
          serviceAddress: json['serviceAddress'],
          servicePhone: json['servicePhone'],
        );

  /// Parse data into json format.
  Map<String, dynamic> toJson() => {
        'data': {
          'serviceId': serviceId,
          'serviceName': serviceName,
          'serviceAddress': serviceAddress,
          'servicePhone': servicePhone,
        },
      };
}
