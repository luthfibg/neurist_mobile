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

  @override
  Future<List<DeviceModel>> get(
      {int? id, String? name, int? value, String? status}) async {
    return await deviceRemoteDataSource.get(
        id: id, name: name, value: value, status: status);
  }

  @override
  Future<bool> delete({required int id}) async {
    return await deviceRemoteDataSource.delete(id: id);
  }
}
