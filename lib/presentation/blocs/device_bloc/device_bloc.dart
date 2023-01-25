import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:neurist_mobile/data/models/device_model.dart';
import 'package:neurist_mobile/domain/use_cases/fetch_device_use_case.dart';
import 'package:neurist_mobile/domain/use_cases/delete_device_use_case.dart';
import 'package:stream_transform/stream_transform.dart';

part 'device_event.dart';
part 'device_state.dart';

/// Duration of time that used for [debounce] process.
const _duration = Duration(milliseconds: 300);

/// [debounce] used to handle event changes with a certain duration.
EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  DeviceBloc(
      {required this.fetchDeviceUseCase, required this.deleteDeviceUseCase})
      : super(DeviceInitialState()) {
    on<DeviceFetchEvent>(_fetch, transformer: debounce(_duration));
    on<DeviceDeleteEvent>(_delete, transformer: debounce(_duration));
  }

  final FetchDeviceUseCase fetchDeviceUseCase;
  final DeleteDeviceUseCase deleteDeviceUseCase;

  /// This method is used as a listener fetch event.
  ///
  /// Return [DeviceFetchEvent] with [List<DeviceModel>] data.
  /// Throw a [DeviceErrorState] along with the error message, if there is an error while retrieving list device data.
  void _fetch(DeviceFetchEvent event, Emitter<DeviceState> emit) async {
    emit(DeviceLoadingState());
    try {
      final listDevice = await fetchDeviceUseCase.call();
      emit(DeviceFetchedState(listDevice: listDevice));
    } catch (error) {
      emit(DeviceErrorState(message: error.toString()));
    }
  }

  void _delete(DeviceDeleteEvent event, Emitter<DeviceState> emit) async {
    try {
      int id = event.id;
      final result = await deleteDeviceUseCase.call(id: id);
      emit(DeviceDeleteState(result: result));
    } catch (error) {
      emit(DeviceErrorState(message: error.toString()));
    }
  }
}
