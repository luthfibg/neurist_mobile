import 'dart:async';

import 'package:dio/dio.dart';
import 'package:neurist_mobile/data/models/service_model.dart';

abstract class ServiceRemoteDataSource {
  Future<List<ServiceModel>> fetch();
  Future<List<ServiceModel>> get({
    int? serviceId,
    String? serviceName,
    String? serviceAddress,
    String? servicePhone,
  });
  // Future<Map<String, dynamic>> insert();
  // Future<ServiceModel> update();
  Future<bool> delete({required int id});
}

class ServiceRemoteDataSourceImpl implements ServiceRemoteDataSource {
  ServiceRemoteDataSourceImpl({required this.dio});

  final Dio dio;

  @override
  Future<List<ServiceModel>> fetch() async {
    try {
      List<ServiceModel> listService = [];
      final response = await dio.get(
          'http://192.168.1.5/neurist_mobile_server/api/service/fetch'); //192.168.1.4

      for (var data in response.data['data']) {
        ServiceModel service = ServiceModel.fromJson(data);
        listService.add(service);
      }
      return listService;
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
  Future<List<ServiceModel>> get({
    int? serviceId,
    String? serviceName,
    String? serviceAddress,
    String? servicePhone,
  }) async {
    try {
      List<ServiceModel> listService = [];
      final response = await dio.get(
          'http://192.168.1.6/neurist_mobile_server/api/service/get.php?id=$serviceId',
          queryParameters: {
            'serviceId': serviceId,
            'serviceName': serviceName,
            'serviceAddress': serviceAddress,
            'servicePhone': servicePhone,
          });

      if (response.statusCode == 200 && response.data.toString().isNotEmpty) {
        for (var data in response.data['data']) {
          ServiceModel service = ServiceModel.fromJson(data);
          listService.add(service);
        }
      }
      return listService;
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

  // @override
  // Future<Map<String, dynamic>> insert() async {
  //   try {
  //     Map<String, dynamic>? service;
  //     final response = await dio.post(
  //         'http://192.168.1.6/neurist_mobile_server/api/device/add',
  //         queryParameters: device);
  //     if (response.statusCode == 200 && response.data.toString().isEmpty) {
  //       return response.headers.map;
  //     } else {
  //       return false;
  //     }
  //   } on DioError catch (e) {
  //     throw (DioError(
  //       requestOptions: e.requestOptions,
  //       response: e.response,
  //       type: e.type,
  //       error: e.error,
  //     ));
  //   } on Exception catch (e) {
  //     throw e.toString();
  //   }
  // }

  // @override
  // Future<DeviceModel> update() async {
  //   try {
  //     late DeviceModel device;
  //     final response = await dio
  //         .put('http://192.168.1.4/neurist_mobile_server/api/device/update');

  //     return device;
  //   } on DioError catch (e) {
  //     throw (DioError(
  //       requestOptions: e.requestOptions,
  //       response: e.response,
  //       type: e.type,
  //       error: e.error,
  //     ));
  //   } on Exception catch (e) {
  //     throw e.toString();
  //   }
  // }

  @override
  Future<bool> delete({required int id}) async {
    try {
      final response = await dio.delete(
          'http://192.168.1.6/neurist_mobile_server/api/service/delete',
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
