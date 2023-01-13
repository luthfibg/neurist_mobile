import 'package:neurist_mobile/data/data_sources/remote/member_remote_data_source.dart';
import 'package:neurist_mobile/data/models/member_model.dart';
import 'package:neurist_mobile/domain/repositories/member_repository.dart';

class MemberRepositoryImpl implements MemberRepository {
  MemberRepositoryImpl({required this.memberRemoteDataSource});

  final MemberRemoteDataSource memberRemoteDataSource;

  @override
  Future<List<MemberModel>> fetch() async {
    return await memberRemoteDataSource.fetch();
  }
}
