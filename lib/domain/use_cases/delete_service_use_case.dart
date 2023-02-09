import 'package:neurist_mobile/domain/repositories/service_repository.dart';

class DeleteServiceUseCase {
  DeleteServiceUseCase({required this.serviceRepository});

  final ServiceRepository serviceRepository;

  Future<bool> call({required int id}) async {
    return await serviceRepository.delete(serviceId: id);
  }
}
