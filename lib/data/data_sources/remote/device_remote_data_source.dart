import 'package:dio/dio.dart';
import 'package:neurist_mobile/data/models/device_model.dart';

abstract class DeviceRemoteDataSource {
  Future<List<DeviceModel>> fetch();
  Future<bool> delete({required int id});
}

class DeviceRemoteDataSourceImpl implements DeviceRemoteDataSource {
  DeviceRemoteDataSourceImpl({required this.dio});

  final Dio dio;

  @override
  Future<List<DeviceModel>> fetch() async {
    try {
      List<DeviceModel> listDevice = [];
      final response = await dio
          .get('http://192.168.1.4/neurist_mobile_server/api/device/fetch');

      for (var data in response.data['data']) {
        DeviceModel device = DeviceModel.fromJson(data);
        listDevice.add(device);
      }
      return listDevice;
    } on DioError catch (e) {
      throw (DioError(
        requestOptions: e.requestOptions,
        response: e.response,
        type: e.type,
        error: e.error,
      ));
    } on Exception catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<bool> delete({required int id}) async {
    try {
      final response = await dio.delete(
          'http://192.168.1.4/neurist_mobile_server/api/device/delete',
          data: {"id": id});
      if (response.statusCode == 200 && response.data.toString().isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      throw (DioError(
        requestOptions: e.requestOptions,
        response: e.response,
        type: e.type,
        error: e.error,
      ));
    } on Exception catch (e) {
      throw e.toString();
    }
  }
}
