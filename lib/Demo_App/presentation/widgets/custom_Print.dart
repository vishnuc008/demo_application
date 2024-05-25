import 'package:flutter/foundation.dart';

customPrint(String message) {
  if (!kReleaseMode) {
    debugPrint( message);
  }
}
