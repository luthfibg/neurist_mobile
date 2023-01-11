import 'package:dio/dio.dart';
import 'package:neurist_mobile/data/models/member_model.dart';

abstract class MemberRemoteDataSource {
  Future<List<MemberModel>> fetch();
}

class MemberRemoteDataSourceImpl implements MemberRemoteDataSource {
  MemberRemoteDataSourceImpl({required this.dio});

  final Dio dio;

  @override
  Future<List<MemberModel>> fetch() async {
    try {
      List<MemberModel> listMember = [];
      final response =
          await dio.get('http://localhost/neurist_mobile/api/member/fetch');
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
}
