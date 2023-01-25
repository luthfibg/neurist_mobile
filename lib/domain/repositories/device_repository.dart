import 'package:neurist_mobile/data/models/device_model.dart';

abstract class DeviceRepository {
  Future<List<DeviceModel>> fetch();
  Future<List<DeviceModel>> get(
      {int? id, String? name, int? value, String? status});
  Future<bool> delete({required int id});
}
