import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:googleapis/calendar/v3.dart' hide Colors;
import 'package:harman_app/core/router/app_routes.dart';
import 'package:harman_app/util/datetime_util.dart';

class DetailEventScreenContent extends StatelessWidget {
  final Event event;

  const DetailEventScreenContent({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        shadowColor: Colors.white,
        backgroundColor: const Color.fromRGBO(43, 58, 81, 1),
        title: const Text(
          'Event Detail',
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.summary ?? '-',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Text(
                '${event.start?.dateTime != null ? DatetimeUtil.formatDate(event.start!.dateTime!) : '-'} - ${event.end?.dateTime != null ? DatetimeUtil.formatDateOnlyTime(event.end!.dateTime!) : '-'}',
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
              Text(
                event.start?.dateTime != null && event.end?.dateTime != null
                    ? DatetimeUtil.getDateDiffInMinute(
                        event.start!.dateTime!,
                        event.end!.dateTime!,
                      )
                    : '-',
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
              const Gap(6),
              Row(
                children: [
                  const Text(
                    'Creator : ',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    event.creator?.email ?? '-',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const Divider(),
              Linkify(
                onOpen: (link) {
                  GoRouter.of(context).pushNamed(
                    AppRoutes.webViewScreen,
                    extra: link.url,
                  );
                },
                text: event.description ?? '-',
                style: const TextStyle(color: Colors.white),
              ),
              const Divider(),
              Text(
                '${event.attendees?.length ?? 0} guest',
                style: const TextStyle(color: Colors.white),
              ),
              const Gap(6),
              if (event.attendees?.isNotEmpty == true)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.people_alt,
                      color: Colors.white,
                    ),
                    const Gap(12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: event.attendees!
                          .map(
                            (e) => Row(
                              children: [
                                if (e.responseStatus == 'accepted') ...[
                                  const Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  ),
                                  const Gap(6),
                                ] else if (e.responseStatus == 'declined') ...[
                                  const Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                                  const Gap(6),
                                ] else if (e.responseStatus == 'tentative') ...[
                                  const Icon(
                                    Icons.question_mark,
                                    color: Colors.white,
                                  ),
                                  const Gap(6),
                                ] else ...[
                                  const Icon(
                                    Icons.info_outline,
                                    color: Colors.white,
                                  ),
                                  const Gap(6),
                                ],
                                Text(
                                  e.email ?? '-',
                                  style: const TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              const Gap(6),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Meet Link: ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Linkify(
                      text: event.conferenceData?.entryPoints?.first.uri ?? '-',
                      style: const TextStyle(color: Colors.white),
                      onOpen: (link) {
                        GoRouter.of(context).pushNamed(
                          AppRoutes.webViewScreen,
                          extra: link.url,
                        );
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
