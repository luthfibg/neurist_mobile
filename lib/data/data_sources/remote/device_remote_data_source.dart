import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:neurist_mobile/data/models/device_model.dart';

abstract class DeviceRemoteDataSource {
  Future<List<DeviceModel>> fetch();
}

class DeviceRemoteDataSourceImpl implements DeviceRemoteDataSource {
  DeviceRemoteDataSourceImpl({required this.dio});

  final Dio dio;

  @override
  Future<List<DeviceModel>> fetch() async {
    try {
      List<DeviceModel> listDevice = [];
      final response = await dio
          .get('http://localhost/neurist_mobile_server/api/device/fetch');
      log('response: ${response.data}');
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
}
