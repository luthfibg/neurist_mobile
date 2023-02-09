import 'package:neurist_mobile/data/models/service_model.dart';
import 'package:neurist_mobile/domain/repositories/service_repository.dart';

class FetchServiceUseCase {
  FetchServiceUseCase({required this.serviceRepository});

  final ServiceRepository serviceRepository;

  Future<List<ServiceModel>> call() async {
    return await serviceRepository.fetch();
  }
}
