// Autogenerated from Pigeon (v22.7.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

PlatformException _createConnectionError(String channelName) {
  return PlatformException(
    code: 'channel-error',
    message: 'Unable to establish connection on channel: "$channelName".',
  );
}

class Calendar {
  Calendar({
    required this.id,
    required this.title,
    required this.hexColor,
    this.sourceName,
  });

  String id;

  String title;

  String hexColor;

  String? sourceName;

  Object encode() {
    return <Object?>[
      id,
      title,
      hexColor,
      sourceName,
    ];
  }

  static Calendar decode(Object result) {
    result as List<Object?>;
    return Calendar(
      id: result[0]! as String,
      title: result[1]! as String,
      hexColor: result[2]! as String,
      sourceName: result[3] as String?,
    );
  }
}

class Event {
  Event({
    this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.calendarId,
    this.description,
    this.url,
    required this.alarms,
  });

  String? id;

  String title;

  int startDate;

  int endDate;

  String calendarId;

  String? description;

  String? url;

  List<Alarm?> alarms;

  Object encode() {
    return <Object?>[
      id,
      title,
      startDate,
      endDate,
      calendarId,
      description,
      url,
      alarms,
    ];
  }

  static Event decode(Object result) {
    result as List<Object?>;
    return Event(
      id: result[0] as String?,
      title: result[1]! as String,
      startDate: result[2]! as int,
      endDate: result[3]! as int,
      calendarId: result[4]! as String,
      description: result[5] as String?,
      url: result[6] as String?,
      alarms: (result[7] as List<Object?>?)!.cast<Alarm?>(),
    );
  }
}

class Alarm {
  Alarm({
    required this.minutes,
  });

  int minutes;

  Object encode() {
    return <Object?>[
      minutes,
    ];
  }

  static Alarm decode(Object result) {
    result as List<Object?>;
    return Alarm(
      minutes: result[0]! as int,
    );
  }
}


class _PigeonCodec extends StandardMessageCodec {
  const _PigeonCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is int) {
      buffer.putUint8(4);
      buffer.putInt64(value);
    }    else if (value is Calendar) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    }    else if (value is Event) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    }    else if (value is Alarm) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 129: 
        return Calendar.decode(readValue(buffer)!);
      case 130: 
        return Event.decode(readValue(buffer)!);
      case 131: 
        return Alarm.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class CalendarActions {
  /// Constructor for [CalendarActions].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  CalendarActions({BinaryMessenger? binaryMessenger, String messageChannelSuffix = ''})
      : pigeonVar_binaryMessenger = binaryMessenger,
        pigeonVar_messageChannelSuffix = messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
  final BinaryMessenger? pigeonVar_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = _PigeonCodec();

  final String pigeonVar_messageChannelSuffix;

  Future<bool> requestCalendarAccess() async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.flutter_calendar_connect.CalendarActions.requestCalendarAccess$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(null) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as bool?)!;
    }
  }

  Future<Calendar> createCalendar(String title, String hexColor) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.flutter_calendar_connect.CalendarActions.createCalendar$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[title, hexColor]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as Calendar?)!;
    }
  }

  Future<List<Calendar>> retrieveCalendars() async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.flutter_calendar_connect.CalendarActions.retrieveCalendars$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(null) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as List<Object?>?)!.cast<Calendar>();
    }
  }

  Future<bool> createOrUpdateEvent(Event flutterEvent) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.flutter_calendar_connect.CalendarActions.createOrUpdateEvent$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_channel.send(<Object?>[flutterEvent]) as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as bool?)!;
    }
  }
}
