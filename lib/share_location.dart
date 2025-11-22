import 'package:geolocator/geolocator.dart';
import 'package:share_plus/share_plus.dart';

import 'custom_toast.dart';

class ShareMyLocation {
  static Future<void> shareCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      CustomToast.error("Location services are disabled.");
      throw Exception("Location services are disabled.");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        CustomToast.error("Location permission denied.");
        throw Exception("Location permission denied.");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      CustomToast.error("Location permission permanently denied.");
      throw Exception("Location permission permanently denied.");
    }
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Generate Google Maps URL
    final url =
        "https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}";

    // Share
    await Share.share(url);
  }
}
