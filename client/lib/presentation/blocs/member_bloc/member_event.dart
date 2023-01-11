part of 'member_bloc.dart';

/// Abstract class to accommodate Member event conditions.
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
