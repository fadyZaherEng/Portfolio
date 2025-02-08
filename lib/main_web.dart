import 'package:universal_html/html.dart' as html;
import 'main.dart' as runner;

Future<void> main() async {
  updateIcon("assets/images/fady.jpg");
  await runner.main();
}

String cleanUrl(String url) {
  url = url.replaceAll(RegExp(r'^https?:\/\/'), '');
  url = url.replaceAll(RegExp(r'\/$'), '');
  return url;
}

void updateIcon(String assetIcon) {
  // Attempt to find an existing link element with rel containing 'icon'
  html.LinkElement link = (html.document.querySelector("link[rel*='icon']") ??
      html.document.createElement('link')) as html.LinkElement;
  // Set the type, rel, and href attributes
  link.type = 'image/x-icon';
  link.rel = 'shortcut icon';
  link.href = assetIcon;
  // If a new link element was created, add it to the document head
  if (link.parent == null) {
    html.document.head!.append(link);
  }
}
