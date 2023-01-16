// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

class Dante {
  @visibleForTesting
  static DateTime? dateTime;
  @visibleForTesting
  static bool test = false;

  static String? e(Object message, [Object? e, StackTrace? stackTrace]) =>
      error(message, e, stackTrace);
  static String? error(Object message, [Object? e, StackTrace? stackTrace]) =>
      _log(
        message,
        error: e,
        stackTrace: stackTrace,
        level: _LogLevel.error,
      );

  static String? w(Object message) => warning(message);
  static String? warning(Object message) => _log(
        message,
        level: _LogLevel.warning,
      );

  static String? i(Object message) => info(message);
  static String? info(Object message) => _log(
        message,
        level: _LogLevel.info,
      );

  static String? d(Object message) => debug(message);
  static String? debug(Object message) => _log(
        message,
        level: _LogLevel.debug,
      );

  static String? _log(
    Object message, {
    required _LogLevel level,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (kDebugMode) {
      final ansiColor = _colorEnabled ? _AnsiColor.map[level.toString()] : '';
      final ansiColorReset = _colorEnabled ? _AnsiColor.reset : '';

      final logLevel =
          '${_colorEnabled ? _AnsiColor.white : ''}🍀 Dante.${level.toString().split('.').last[0].toUpperCase()}';

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
      if (!test) {
        print(logValue);
      }

      return logContent;
    }
    return null;
  }

  static bool get _colorEnabled {
    if (kIsWeb) {
      return false;
    } else {
      return Platform.isAndroid;
    }
  }
}

enum _LogLevel {
  debug,
  error,
  info,
  warning,
}

class _AnsiColor {
  static const map = {
    '_LogLevel.info': green,
    '_LogLevel.error': red,
    '_LogLevel.debug': cyan,
    '_LogLevel.warning': yellow,
  };

  static const cyan = '\x1B[36m';
  static const green = '\x1B[32m';
  static const red = '\x1B[31m';
  static const reset = '\x1B[0m';
  static const white = '\x1B[37m';
  static const yellow = '\x1B[33m';
}
