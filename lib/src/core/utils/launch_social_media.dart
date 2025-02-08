import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

void launchWhatsApp(
    {required String phoneNumber,
    required void Function() onOpenWhatsappFailed}) async {
  String whatsappUrl = "whatsapp://send?phone=$phoneNumber&text=";
  try {
    await launchUrlString(whatsappUrl);
  } catch (e) {
    if (Platform.isAndroid) {
      String url = "https://play.google.com/store/apps/details?id=com.whatsapp";
      await launch(url);
    } else if (Platform.isIOS) {
      String url = "https://apps.apple.com/app/whatsapp-messenger/id310633997";
      await launch(url);
    } else {
      onOpenWhatsappFailed();
    }
  }
}

void launchCaller(String phoneNumber) async {
  final url = 'tel:$phoneNumber';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
