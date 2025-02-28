import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

void logMessage(String type, String value, String color) {
  if (!kDebugMode) return;

  var trace = StackTrace.current.toString().split('\n');
  if (trace.length > 1) {
    var relevantTrace = trace[2];
    var match = RegExp(r'#\d+\s+(.+?)\s+\((.+?)\)').firstMatch(relevantTrace);

    if (match != null) {
      var location = match.group(1) ?? "Unknown";
      if (kDebugMode) {
        print('\n ');
      }
      debugPrint('$color [$type] $location -> $value ${AnsiColor.ansiDefault}');
      if (kDebugMode) {
        print('\n ');
      }
      return;
    }
  }
  if (kDebugMode) {
    print('\n ');
  }
  debugPrint('$color [$type] Unknown -> $value ${AnsiColor.ansiDefault}');
  if (kDebugMode) {
    print('\n ');
  }
}

void logI(String value) => logMessage("INFO", value, '${AnsiColor.fg(12)}');

void logE(String value) => logMessage("ERROR", value, '\x1B[31m');

void logW(String value) => logMessage("WARNING", value, '\x1B[33m');

void logS(String value) => logMessage("SUCCESS", value, '\x1B[32m');
