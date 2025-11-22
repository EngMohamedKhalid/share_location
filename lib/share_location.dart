import 'package:geolocator/geolocator.dart';
import 'package:share_plus/share_plus.dart';
import 'custom_toast.dart';
import 'package:flutter/widgets.dart';

class ShareMyLocation {
  static Future<void> shareCurrentLocation({String? shareMessage}) async {
    final bool isArabic = WidgetsBinding.instance.platformDispatcher.locale.languageCode == "ar";
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      CustomToast.error(
          isArabic
              ? "خدمات تحديد الموقع مغلقة"
              : "Location services are disabled.",
      );
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        CustomToast.error(
          isArabic
            ? "تم رفض إذن الموقع"
            : "Location permission denied.",
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      CustomToast.error(isArabic
          ? "تم رفض إذن الموقع بشكل نهائي"
          : "Location permission permanently denied.",
      );
      return;
    }
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
      ),
    );
    final url =
        "https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}";
    await SharePlus.instance.share(
      ShareParams(
        subject: isArabic
            ? (shareMessage ?? "مشاركة موقعي")
            : (shareMessage ?? "Share My Location"),
        text: url,
      ),
    );
  }
}