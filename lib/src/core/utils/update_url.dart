import 'package:flutter/foundation.dart';
import 'package:universal_html/html.dart' as html;

void updateUrl(String newPath) {
  if (kIsWeb) {
    html.window.history.pushState(null, 'GetInTouch', newPath);
  }
}

void replaceUrl(String newPath) {
  if (kIsWeb) {
    html.window.history.replaceState(null, 'GetInTouch', newPath);
  }
}
