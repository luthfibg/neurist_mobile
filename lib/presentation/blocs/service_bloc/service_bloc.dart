import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:neurist_mobile/data/models/service_model.dart';
import 'package:neurist_mobile/domain/use_cases/fetch_service_use_case.dart';
import 'package:neurist_mobile/domain/use_cases/delete_service_use_case.dart';
import 'package:stream_transform/stream_transform.dart';

part 'service_event.dart';
part 'service_state.dart';

/// Duration of time that used for [debounce] process.
const _duration = Duration(milliseconds: 300);

/// [debounce] used to handle event changes with a certain duration.
EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  ServiceBloc(
      {required this.fetchServiceUseCase, required this.deleteServiceUseCase})
      : super(ServiceInitialState()) {
    on<ServiceFetchEvent>(_fetch, transformer: debounce(_duration));
    on<ServiceDeleteEvent>(_delete, transformer: debounce(_duration));
  }

  final FetchServiceUseCase fetchServiceUseCase;
  final DeleteServiceUseCase deleteServiceUseCase;

  /// This method is used as a listener fetch event.
  ///
  /// Return [ServiceFetchEvent] with [List<ServiceModel>] data.
  /// Throw a [ServiceErrorState] along with the error message, if there is an error while retrieving list service data.
  void _fetch(ServiceFetchEvent event, Emitter<ServiceState> emit) async {
    emit(ServiceLoadingState());
    try {
      final listService = await fetchServiceUseCase.call();
      emit(ServiceFetchedState(listService: listService));
    } catch (error) {
      emit(ServiceErrorState(message: error.toString()));
    }
  }

  void _delete(ServiceDeleteEvent event, Emitter<ServiceState> emit) async {
    try {
      int serviceId = event.serviceId;
      final result = await deleteServiceUseCase.call(id: serviceId);
      emit(ServiceDeleteState(result: result));
    } catch (error) {
      emit(ServiceErrorState(message: error.toString()));
    }
  }
}
