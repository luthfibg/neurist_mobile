import 'dart:async';

import 'package:dio/dio.dart';
import 'package:neurist_mobile/data/models/member_model.dart';

abstract class MemberRemoteDataSource {
  Future<List<MemberModel>> fetch();
  Future<List<MemberModel>> get({
    int? id,
    String? name,
    int? age,
    String? address,
    int? serviceId,
    String? phone,
    String? email,
  });
  // Future<Map<String, dynamic>> insert();
  // Future<MemberModel> update();
  Future<bool> delete({required int id});
}

class MemberRemoteDataSourceImpl implements MemberRemoteDataSource {
  MemberRemoteDataSourceImpl({required this.dio});

  final Dio dio;

  @override
  Future<List<MemberModel>> fetch() async {
    try {
      List<MemberModel> listMember = [];
      final response = await dio.get(
          'http://192.168.1.5/neurist_mobile_server/api/member/fetch'); //192.168.1.4

      for (var data in response.data['data']) {
        MemberModel member = MemberModel.fromJson(data);
        listMember.add(member);
      }
      return listMember;
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
  Future<List<MemberModel>> get({
    int? id,
    String? name,
    int? age,
    String? address,
    int? serviceId,
    String? phone,
    String? email,
  }) async {
    try {
      List<MemberModel> listMember = [];
      final response = await dio.get(
          'http://192.168.1.6/neurist_mobile_server/api/member/get.php?id=$id',
          queryParameters: {
            'id': id,
            'name': name,
            'age': age,
            'address': address,
            'serviceId': serviceId,
            'phone': phone,
            'email': email,
          });

      if (response.statusCode == 200 && response.data.toString().isNotEmpty) {
        for (var data in response.data['data']) {
          MemberModel member = MemberModel.fromJson(data);
          listMember.add(member);
        }
      }
      return listMember;
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
  //     Map<String, dynamic>? device;
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
          'http://192.168.1.5/neurist_mobile_server/api/member/delete',
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
