part of 'service_bloc.dart';

abstract class ServiceState extends Equatable {
  const ServiceState();

  @override
  List<Object?> get props => [];
}

/// The state where [ServiceState] has fetched [List<ServiceModel>].
class ServiceFetchedState extends ServiceState {
  const ServiceFetchedState({required this.listService});

  final List<ServiceModel> listService;

  @override
  List<Object?> get props => [listService];
}

/// The state where [ServiceState] is initializing the state.
class ServiceInitialState extends ServiceState {}

/// The state where [ServiceState] is loading data.
class ServiceLoadingState extends ServiceState {}

/// The state where [ServiceState] has loaded [ServiceModel].
class ServiceLoadedState extends ServiceState {
  const ServiceLoadedState({this.service});

  final ServiceModel? service;

  @override
  List<Object> get props => [service!];
}

/// The state where [ServiceState] has an error including and error message.
class ServiceErrorState extends ServiceState {
  const ServiceErrorState({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}

class ServiceDeleteState extends ServiceState {
  const ServiceDeleteState({required this.result});

  final bool result;

  @override
  List<Object?> get props => [result];
}
