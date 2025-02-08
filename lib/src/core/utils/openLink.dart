import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

void openLink(String url) async {
  try {
    await launch(url);
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}
