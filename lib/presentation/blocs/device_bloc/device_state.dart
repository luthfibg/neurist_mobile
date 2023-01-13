part of 'device_bloc.dart';

abstract class DeviceState extends Equatable {
  const DeviceState();

  @override
  List<Object?> get props => [];
}

/// The state where [DeviceState] has fetched [List<DeviceModel>].
class DeviceFetchedState extends DeviceState {
  const DeviceFetchedState({required this.listDevice});

  final List<DeviceModel> listDevice;

  @override
  List<Object?> get props => [listDevice];
}

/// The state where [DeviceState] is initializing the state.
class DeviceInitialState extends DeviceState {}

/// The state where [DeviceState] is loading data.
class DeviceLoadingState extends DeviceState {}

/// The state where [DeviceState] has loaded [DeviceModel].
class DeviceLoadedState extends DeviceState {
  const DeviceLoadedState({this.device});

  final DeviceModel? device;

  @override
  List<Object> get props => [device!];
}

/// The state where [DeviceState] has an error including and error message.
class DeviceErrorState extends DeviceState {
  const DeviceErrorState({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
