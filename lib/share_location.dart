import 'package:geolocator/geolocator.dart';
import 'package:share_plus/share_plus.dart';

import 'custom_toast.dart';

class ShareMyLocation {
  static Future<void> shareCurrentLocation({String? shareMessage}) async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      CustomToast.error("Location services are disabled.");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        CustomToast.error("Location permission denied.");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      CustomToast.error("Location permission permanently denied.");
    }
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );

    final url =
        "https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}";
    await SharePlus.instance.share(ShareParams(
      subject:shareMessage?? "Share My Location",
      text: url,
    ));
  }
}