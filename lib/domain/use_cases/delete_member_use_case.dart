import 'package:neurist_mobile/domain/repositories/member_repository.dart';

class DeleteMemberUseCase {
  DeleteMemberUseCase({required this.memberRepository});

  final MemberRepository memberRepository;

  Future<bool> call({required int id}) async {
    return await memberRepository.delete(id: id);
  }
}
