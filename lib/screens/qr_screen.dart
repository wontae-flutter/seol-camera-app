import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrScreen extends StatelessWidget {
  const QrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Screen"),
      ),
      body: Center(
        child: QrImage(
          data: 'This is a simple QR code',
          version: QrVersions.auto,
          size: 320,
          gapless: false,
        ),
      ),
      //* A QR code with an image (from your application's assets)
    );
  }
}
