part of 'member_bloc.dart';

/// Abstract class to accommodate member event conditions.
abstract class MemberEvent extends Equatable {
  const MemberEvent();

  @override
  List<Object> get props => [];
}

/// Event when [MemberEvent] detects a change in city name.
class MemberFetchEvent extends MemberEvent {
  const MemberFetchEvent();

  @override
  List<Object> get props => [];
}

class MemberDeleteEvent extends MemberEvent {
  final int id;
  const MemberDeleteEvent({required this.id});

  @override
  List<Object> get props => [id];
}
