// ignore_for_file: aString?_print, unnecessary_string_escapes, avoid_print

import 'dart:convert';

import 'package:flutter/foundation.dart';

class Dante {
  @visibleForTesting
  static DateTime? dateTime;
  @visibleForTesting
  static bool test = false;

  static String? e(Object message, [Object? e, StackTrace? stackTrace]) =>
      error(message, e, stackTrace);
  static String? error(Object message, [Object? e, StackTrace? stackTrace]) =>
      log(
        message,
        error: e,
        stackTrace: stackTrace,
        level: LogLevel.error,
      );

  static String? w(Object message) => warning(message);
  static String? warning(Object message) => log(
        message,
        level: LogLevel.warning,
      );

  static String? i(Object message) => info(message);
  static String? info(Object message) => log(
        message,
        level: LogLevel.info,
      );

  static String? d(Object message) => debug(message);
  static String? debug(Object message) => log(
        message,
        level: LogLevel.debug,
      );

  static String? log(
    Object message, {
    required LogLevel level,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (kDebugMode) {
      final ansiColor = AnsiColor.map[level.toString()];
      const ansiColorReset = AnsiColor.reset;

      final logLevel =
          '${AnsiColor.white}🍀 Dante.${level.toString().split('.').last[0].toUpperCase()}';

      final time = dateTime ?? DateTime.now().toString();

      final logHeader = '📜 🖋  $logLevel  ⏰ $time $ansiColorReset\n';

      final m = jsonEncode(message.toString());
      var logContent = m.substring(1, m.length - 1);
      if (error != null) {
        logContent += '\n      Error: $error';
      }
      if (stackTrace != null) {
        logContent += '\n      StackTrace: $stackTrace';
      }
      final logValue =
          '$logHeader     $ansiColor $logContent\n $ansiColorReset';
      if (!test) print(logValue);

      return logContent;
    }
  }
}

enum LogLevel {
  debug,
  error,
  info,
  warning,
}

class AnsiColor {
  static const map = {
    'LogLevel.info': green,
    'LogLevel.error': red,
    'LogLevel.debug': cyan,
    'LogLevel.warning': yellow,
  };

  static const cyan = '\x1B[36m';
  static const green = '\x1B[32m';
  static const red = '\x1B[31m';
  static const reset = '\x1B[0m';
  static const white = '\x1B[37m';
  static const yellow = '\x1B[33m';
}
