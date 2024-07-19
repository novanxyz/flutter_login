part of 'get_calendar_event_bloc.dart';

enum GetCalendarEventStatus {
  initial,
  loading,
  loaded;

  bool get isInitial => this == GetCalendarEventStatus.initial;

  bool get isLoading => this == GetCalendarEventStatus.loading;

  bool get isLoaded => this == GetCalendarEventStatus.loaded;
}
@freezed
class GetCalendarEventState with _$GetCalendarEventState {
  const factory GetCalendarEventState({
    Events? data,
    String? error,
    @Default(
      GetCalendarEventStatus.initial,
    )
    GetCalendarEventStatus status,
  }) = _GetCalendarEventState;
}
