part of 'device_bloc.dart';

/// Abstract class to accommodate device event conditions.
abstract class DeviceEvent extends Equatable {
  const DeviceEvent();

  @override
  List<Object> get props => [];
}

/// Event when [DeviceEvent] detects a change in city name.
class DeviceFetchEvent extends DeviceEvent {
  const DeviceFetchEvent();

  @override
  List<Object> get props => [];
}
