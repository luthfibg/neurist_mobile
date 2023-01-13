import 'package:neurist_mobile/data/models/device_model.dart';

abstract class DeviceRepository {
  Future<List<DeviceModel>> fetch();
}
