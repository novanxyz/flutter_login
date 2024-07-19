import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:harman_app/core/auth/login_api.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'get_calendar_event_event.dart';

part 'get_calendar_event_state.dart';

part 'get_calendar_event_bloc.freezed.dart';

class GetCalendarEventBloc
    extends Bloc<GetCalendarEventEvent, GetCalendarEventState> {
  GetCalendarEventBloc() : super(const GetCalendarEventState()) {
    on<_Fetch>(_handleFetchData);
  }

  _handleFetchData(
    _Fetch event,
    Emitter<GetCalendarEventState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: GetCalendarEventStatus.loading,
        ),
      );
      Events listEvents = await LoginApi.getCalendar();

      emit(
        state.copyWith(data: listEvents, status: GetCalendarEventStatus.loaded),
      );
    } catch (e) {
      emit(
        state.copyWith(
          data: null,
          status: GetCalendarEventStatus.loaded,
          error: e.toString(),
        ),
      );
    }
  }
}
