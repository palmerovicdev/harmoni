import 'package:flutter/foundation.dart';

logI(String value) {
  var trace = StackTrace.current.toString().split('\n');
  var relevantTrace = trace[1];
  var className = relevantTrace.split('.')[0].trim();
  var methodName = relevantTrace.split('.')[1].split(' ')[0].trim();
  var blue = '\x1B[34m';
  var reset = '\x1B[0m';
  if (kDebugMode) {
    print('$blue$className::$methodName -> $value$reset');
  }
}

logE(String value) {
  var trace = StackTrace.current.toString().split('\n');
  var relevantTrace = trace[1];
  var className = relevantTrace.split('.')[0].trim();
  var methodName = relevantTrace.split('.')[1].trim();
  var red = '\x1B[31m';
  var reset = '\x1B[0m';
  if (kDebugMode) {
    print('$red$className::$methodName -> $value$reset');
  }
}

logW(String value) {
  var trace = StackTrace.current.toString().split('\n');
  var relevantTrace = trace[1];
  var className = relevantTrace.split('.')[0].trim();
  var methodName = relevantTrace.split('.')[1].trim();
  var yellow = '\x1B[33m';
  var reset = '\x1B[0m';
  if (kDebugMode) {
    print('$yellow$className::$methodName -> $value$reset');
  }
}

logS(String value) {
  var trace = StackTrace.current.toString().split('\n');
  var relevantTrace = trace[1];
  var className = relevantTrace.split('.')[0].trim();
  var methodName = relevantTrace.split('.')[1].trim();
  var green = '\x1B[32m';
  var reset = '\x1B[0m';
  if (kDebugMode) {
    print('$green$className::$methodName -> $value$reset');
  }
}