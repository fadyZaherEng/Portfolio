import "package:universal_html/html.dart" as html;

String userAgent = html.window.navigator.userAgent;

bool isOpenedInBrowser() =>
    userAgent.contains('Chrome') ||
    userAgent.contains('Edge') ||
    userAgent.contains('google') ||
    userAgent.contains('Safari') ||
    userAgent.contains('Firefox');
