import 'package:flutter/foundation.dart';

void safePrint(dynamic value) {
  if (kDebugMode) {
    print(value);
  }
}