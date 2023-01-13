import 'package:neurist_mobile/data/data_sources/remote/device_remote_data_source.dart';
import 'package:neurist_mobile/data/models/device_model.dart';
import 'package:neurist_mobile/domain/repositories/device_repository.dart';

class DeviceRepositoryImpl implements DeviceRepository {
  DeviceRepositoryImpl({required this.deviceRemoteDataSource});

  final DeviceRemoteDataSource deviceRemoteDataSource;

  @override
  Future<List<DeviceModel>> fetch() async {
    return await deviceRemoteDataSource.fetch();
  }
}
