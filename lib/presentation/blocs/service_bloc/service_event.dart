part of 'service_bloc.dart';

/// Abstract class to accommodate service event conditions.
abstract class ServiceEvent extends Equatable {
  const ServiceEvent();

  @override
  List<Object> get props => [];
}

/// Event when [ServiceEvent] detects a change in city name.
class ServiceFetchEvent extends ServiceEvent {
  const ServiceFetchEvent();

  @override
  List<Object> get props => [];
}

class ServiceDeleteEvent extends ServiceEvent {
  final int serviceId;
  const ServiceDeleteEvent({required this.serviceId});

  @override
  List<Object> get props => [serviceId];
}
