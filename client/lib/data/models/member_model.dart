import 'package:neurist_mobile/domain/entity/member_entity.dart';

/// Instance of class [ProductEntity] which has the role of fetching and parsing data from/to json.
class MemberModel extends MemberEntity {
  /// Fetch data from json format.
  MemberModel.fromJson(Map<String, dynamic> json)
      : super(
          id: json['id'],
          name: json['name'],
          age: json['age'],
          address: json['address'],
          serviceId: json['service_id'],
          phone: json['phone'],
          email: json['email'],
        );

  /// Parse data into json format.
  Map<String, dynamic> toJson() => {
        'weather': {
          'id': id,
          'name': name,
          'age': age,
          'address': address,
          'service_id': serviceId,
          'phone': phone,
          'email': email,
        },
      };
}
