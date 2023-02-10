import 'package:neurist_mobile/data/models/member_model.dart';

abstract class MemberRepository {
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
  Future<bool> delete({required int id});
}
