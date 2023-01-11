import 'package:neurist_mobile/data/models/member_model.dart';

abstract class MemberRepository {
  Future<List<MemberModel>> fetch();
}
