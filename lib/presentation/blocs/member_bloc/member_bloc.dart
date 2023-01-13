import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:neurist_mobile/data/models/member_model.dart';
import 'package:neurist_mobile/domain/use_cases/fetch_member_use_case.dart';
import 'package:stream_transform/stream_transform.dart';

part 'member_event.dart';
part 'member_state.dart';

/// Duration of time that used for [debounce] process.
const _duration = Duration(milliseconds: 300);

/// [debounce] used to handle event changes with a certain duration.
EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class MemberBloc extends Bloc<MemberEvent, MemberState> {
  MemberBloc({required this.fetchMemberUseCase}) : super(MemberInitialState()) {
    on<MemberFetchEvent>(_fetch, transformer: debounce(_duration));
  }

  final FetchMemberUseCase fetchMemberUseCase;

  /// This method is used as a listener fetch event.
  ///
  /// Return [MemberFetchEvent] with [List<MemberModel>] data.
  /// Throw a [MemberErrorState] along with the error message, if there is an error while retrieving list member data.
  void _fetch(MemberFetchEvent event, Emitter<MemberState> emit) async {
    emit(MemberLoadingState());
    try {
      final listMember = await fetchMemberUseCase.call();
      emit(MemberFetchedState(listMember: listMember));
    } catch (error) {
      emit(MemberErrorState(message: error.toString()));
    }
  }
}
