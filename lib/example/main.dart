import 'package:flutter/material.dart';
import '../share_location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Share My Location Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Share My Location"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await ShareMyLocation.shareCurrentLocation(
              shareMessage: "Here is my current location!",
            );
          },
          child: const Text("Share My Current Location"),
        ),
      ),
    );
  }
}