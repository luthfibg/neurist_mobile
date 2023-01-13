import 'package:neurist_mobile/data/models/device_model.dart';
import 'package:neurist_mobile/domain/repositories/device_repository.dart';

class FetchDeviceUseCase {
  FetchDeviceUseCase({required this.deviceRepository});

  final DeviceRepository deviceRepository;

  Future<List<DeviceModel>> call() async {
    return await deviceRepository.fetch();
  }
}
