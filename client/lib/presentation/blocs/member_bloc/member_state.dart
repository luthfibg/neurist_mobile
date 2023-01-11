part of 'member_bloc.dart';

abstract class MemberState extends Equatable {
  const MemberState();

  @override
  List<Object?> get props => [];
}

/// The state where [MemberState] has fetched [List<MemberModel>].
class MemberFetchedState extends MemberState {
  const MemberFetchedState({required this.listMember});

  final List<MemberModel> listMember;

  @override
  List<Object?> get props => [listMember];
}

/// The state where [MemberState] is initializing the state.
class MemberInitialState extends MemberState {}

/// The state where [MemberState] is loading data.
class MemberLoadingState extends MemberState {}

/// The state where [MemberState] has loaded [MemberModel].
class MemberLoadedState extends MemberState {
  const MemberLoadedState({this.member});

  final MemberModel? member;

  @override
  List<Object> get props => [member!];
}

/// The state where [MemberState] has an error including and error message.
class MemberErrorState extends MemberState {
  const MemberErrorState({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
