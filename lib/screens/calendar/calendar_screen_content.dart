import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:googleapis/calendar/v3.dart' hide Colors;
import 'package:harman_app/blocs/get_calendar_event/get_calendar_event_bloc.dart';
import 'package:harman_app/core/router/app_routes.dart';
import 'package:harman_app/util/datetime_util.dart';

class CalendarScreenContent extends StatefulWidget {
  const CalendarScreenContent({super.key});

  @override
  State<CalendarScreenContent> createState() => _CalendarScreenContentState();
}

class _CalendarScreenContentState extends State<CalendarScreenContent> {
  @override
  void initState() {
    context.read<GetCalendarEventBloc>().add(
          const GetCalendarEventEvent.fetch(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        shadowColor: Colors.white,
        backgroundColor: const Color.fromRGBO(43, 58, 81, 1),
        title: const Text(
          'Calendar Events',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<GetCalendarEventBloc, GetCalendarEventState>(
            builder: (context, state) {
              if (state.status.isLoaded) {
                if (state.data?.items?.isEmpty == true) {
                  return const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Tidak ada event',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        Event? event = state.data?.items?[index];
                        return InkWell(
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRoutes.detailEventScreen,
                              extra: event,
                            );
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    event?.summary ?? '-',
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    '${event?.start?.dateTime != null ? DatetimeUtil.formatDate(event!.start!.dateTime!) : '-'} - ${event?.end?.dateTime != null ? DatetimeUtil.formatDateOnlyTime(event!.end!.dateTime!) : '-'}',
                                    style: const TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                  const Gap(6),
                                  Row(
                                    children: [
                                      const Text(
                                        'Creator : ',
                                      ),
                                      Text(
                                        event?.creator?.email ?? '-',
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  Text(event?.location ?? '-'),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Gap(6);
                      },
                      itemCount: state.data?.items?.length ?? 0,
                    ),
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
