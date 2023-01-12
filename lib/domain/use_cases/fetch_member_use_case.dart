import 'package:neurist_mobile/data/models/member_model.dart';
import 'package:neurist_mobile/domain/repositories/member_repository.dart';

class FetchMemberUseCase {
  FetchMemberUseCase({required this.memberRepository});

  final MemberRepository memberRepository;

  Future<List<MemberModel>> call() async {
    return await memberRepository.fetch();
  }
}
