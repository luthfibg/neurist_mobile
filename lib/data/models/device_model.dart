import 'package:neurist_mobile/domain/entity/device_entity.dart';

/// Instance of class [DeviceEntity] which has the role of fetching and parsing data from/to json.
class DeviceModel extends DeviceEntity {
  /// Fetch data from json format.
  DeviceModel.fromJson(Map<String, dynamic> json)
      : super(
          id: json['id'],
          name: json['name'],
          value: json['value'],
          status: json['status'],
        );

  /// Parse data into json format.
  Map<String, dynamic> toJson() => {
        'data': {
          'id': id,
          'name': name,
          'value': value,
          'status': status,
        },
      };
}
