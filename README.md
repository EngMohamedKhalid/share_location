# 📍 Share My Location

Share My Location is a simple and lightweight Flutter package that
allows you to share the user's current location through any sharing app
(WhatsApp, Messenger, Email, SMS, etc.) using a direct Google Maps link.
It also supports auto-localized error messages based on the device
language.

------------------------------------------------------------------------

## ✨ Features

-   🔥 Fetch the user's current location with high accuracy
-   🗺 Share a direct Google Maps URL
-   🔐 Automatically handles location permissions
-   ⚡ Easy to integrate and use
-   📦 Built on top of trusted packages:
    -   geolocator
    -   share_plus

------------------------------------------------------------------------

## 🚀 Getting Started

### Android Setup

Add these permissions inside:\
`android/app/src/main/AndroidManifest.xml`

    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>

### iOS Setup

Inside:\
`ios/Runner/Info.plist`

    <key>NSLocationWhenInUseUsageDescription</key>
    <string>This app needs access to your location to share it.</string>

------------------------------------------------------------------------

## 📦 Installation

Add the package to **pubspec.yaml**:

    dependencies:
      share_my_location: ^1.0.0

Then run:

    flutter pub get

------------------------------------------------------------------------

## 💡 Usage

``` dart
import 'package:share_my_location/share_my_location.dart';

ElevatedButton(
  onPressed: () async {
    await ShareMyLocation.shareCurrentLocation(
      shareMessage: "My Current Location",
    );
  },
  child: const Text("Share My Location"),
)
```

------------------------------------------------------------------------

## 📌 What This Package Does

-   Checks whether:
    -   Location services are enabled\
    -   The app has location permissions\
-   Shows localized error messages\
-   Retrieves the current coordinates using Geolocator\
-   Generates a ready-to-share Google Maps link

Example link:\
`https://www.google.com/maps/search/?api=1&query=30.0444,31.2357`

------------------------------------------------------------------------

## ❗ Error Messages

The package automatically displays the following error messages when
needed:

  -----------------------------------------------------------------------
Situation                 English Message
  ------------------------- ---------------------------------------------
Location services         Location services are disabled
disabled

Permission denied         Location permission denied

Permission denied forever Location permission permanently denied
-----------------------------------------------------------------------

------------------------------------------------------------------------

## 🛠 Contributing

Contributions are welcome!\
Feel free to open issues or submit pull requests on GitHub.

------------------------------------------------------------------------

## 📫 Support

If you face any issues, please open an issue on the GitHub repository.

------------------------------------------------------------------------

## ⚖️ License

MIT License.
