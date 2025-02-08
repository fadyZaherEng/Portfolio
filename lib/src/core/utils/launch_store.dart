// ignore_for_file: avoid_print

import 'dart:io';

 import 'package:huawei_hmsavailability/huawei_hmsavailability.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:url_launcher/url_launcher.dart';

void launchStore(
  void Function() logout,
) async {
  String androidPackageName = "";
  String iOSAppId = "";
  String huaweiAppId = "";

  // if (F.isNiceTouch) {
  //   androidPackageName = "com.sprinteye.cityeye.nicetouch";
  //   iOSAppId = "6503001819";
  //   huaweiAppId = "110585625";
  // } else if (F.isElmanara) {
  //   androidPackageName = "com.sprinteye.elmanaraapp";
  //   iOSAppId = "6503253984";
  //   huaweiAppId = "111391429";
  // } else if (F.isSectionsElwafii) {
  //   androidPackageName = "com.sprinteye.cityeye.sections";
  //   iOSAppId = "6636485256";
  //   huaweiAppId = "111771547";
  // } else if (F.isOmElNour) {
  //   androidPackageName = "com.sprinteye.omelnour";
  //   iOSAppId = "6520388383";
  //   huaweiAppId = "111748435";
  // } else {
  //   androidPackageName = "com.sprinteye.cityeye.app";
  //   iOSAppId = "6474612743";
  //   huaweiAppId = "110578913";
  // }

  if (Platform.isIOS) {
    final url = 'https://apps.apple.com/app/id$iOSAppId';
    try {
      launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)
          .then((value) => value ? logout() : null);
    } catch (e) {
      print(e);
    }
  } else {
    if (await HmsApiAvailability().isHMSAvailableWithApkVersion(28) != 1) {
      final url = "https://appgallery.huawei.com/app/C$huaweiAppId";
      try {
        launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)
            .then((value) => value ? logout() : null);
      } catch (e) {
        print(e);
      }
    } else {
      final url = 'https://play.google.com/store/apps/details?id=$androidPackageName';
      try {
        launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)
            .then((value) => value ? logout() : null);
      } catch (e) {
        print(e);
      }
    }
  }
}
