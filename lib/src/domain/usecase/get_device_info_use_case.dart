// import 'package:city_eye/src/core/resources/shared_preferences_keys.dart';
// import 'package:city_eye/src/domain/entities/device_info/device_info.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class GetDeviceInfoUseCase {
//   late final SharedPreferences sharedPreferences;
//
//   GetDeviceInfoUseCase(this.sharedPreferences);
//
//   DeviceInfo call() {
//     return sharedPreferences.getString(SharedPreferenceKeys.deviceInfo) != null
//         ? DeviceInfo.fromJson(
//             sharedPreferences.getString(SharedPreferenceKeys.deviceInfo) ?? "")
//         : DeviceInfo();
//   }
// }
