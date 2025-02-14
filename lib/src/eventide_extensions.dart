import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:eventide/src/calendar_api.g.dart';
import 'package:eventide/src/eventide_platform_interface.dart';

extension ColorToValue on Color {
  int toValue() =>
      _floatToInt8(a) << 24 |
      _floatToInt8(r) << 16 |
      _floatToInt8(g) << 8 |
      _floatToInt8(b) << 0;

  int _floatToInt8(double x) => (x * 255.0).round() & 0xff;
}

extension CalendarToECCalendar on Calendar {
  ETCalendar toETCalendar() {
    return ETCalendar(
      id: id,
      title: title,
      color: Color(color),
      isWritable: isWritable,
      sourceName: sourceName,
    );
  }
}

extension EventToECEvent on Event {
  ETEvent toETEvent() {
    return ETEvent(
      id: id,
      title: title,
      isAllDay: isAllDay,
      startDate: DateTime.fromMillisecondsSinceEpoch(startDate),
      endDate: DateTime.fromMillisecondsSinceEpoch(endDate),
      calendarId: calendarId,
      description: description,
      url: url,
      reminders: [
        if (reminders != null) ...reminders!.toDurationList(),
      ],
    );
  }
}

extension CalendarListToECCalendar on List<Calendar> {
  List<ETCalendar> toETCalendarList() {
    return map((c) => c.toETCalendar()).toList();
  }
}

extension EventListToECEvent on List<Event> {
  List<ETEvent> toETEventList() {
    return map((e) => e.toETEvent()).toList();
  }
}

extension NativeToDuration on int {
  Duration toDuration() {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        return Duration(seconds: abs());
      case TargetPlatform.android:
        return Duration(minutes: abs());
      default:
        throw UnsupportedError('Unsupported platform');
    }
  }
}

extension DurationToNative on Duration {
  int toNativeDuration() {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        return inSeconds.abs();
      case TargetPlatform.android:
        return inMinutes.abs();
      default:
        throw UnsupportedError('Unsupported platform');
    }
  }
}

extension DurationListToNative on List<Duration> {
  List<int> toNativeList() {
    return map((d) => d.toNativeDuration()).toList();
  }
}

extension NativeListToDuration on List<int> {
  List<Duration> toDurationList() {
    return map((i) => i.toDuration()).toList();
  }
}
