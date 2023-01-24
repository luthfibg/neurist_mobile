import 'package:neurist_mobile/domain/repositories/device_repository.dart';

class DeleteDeviceUseCase {
  DeleteDeviceUseCase({required this.deviceRepository});

  final DeviceRepository deviceRepository;

  Future<bool> call({required int id}) async {
    return await deviceRepository.delete(id: id);
  }
}
