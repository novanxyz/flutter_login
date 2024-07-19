import 'package:flutter/material.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:harman_app/screens/detail_event/detail_event_screen_content.dart';

class DetailEventScreen extends StatelessWidget {
  final Event event;

  const DetailEventScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return DetailEventScreenContent(
      event: event,
    );
  }
}
