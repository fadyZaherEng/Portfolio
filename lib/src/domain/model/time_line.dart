import 'package:flutter/material.dart';

class TimelineEvent {
  final String title;
  final String place;
  final String date;
  final String url;
  final Color color;

  TimelineEvent({
    required this.title,
    required this.place,
    required this.date,
    required this.url,
    required this.color,
  });
}
