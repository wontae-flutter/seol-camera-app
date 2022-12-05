import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import './screens/screens.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "QR APP",
      initialRoute: "/",
      routes: {
        "/": (context) => MainScreen(),
        "/camera": (context) => CameraScreen(),
        "/qr": (context) => QrScreen(),
        "/qr_scanner": (context) => QrScannerScreen(),
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/camera");
              },
              // onPressed: () => context.go("/camera"),
              child: Text('Camera'),
            ),
            ElevatedButton(
              // onPressed: () => context.go("/qr"),
              onPressed: () {
                Navigator.of(context).pushNamed("/qr");
              },
              child: Text('Qr'),
            ),
            ElevatedButton(
              // onPressed: () => context.go("/qr_scanner"),
              onPressed: () {
                Navigator.of(context).pushNamed("/qr_scanner");
              },
              child: Text('Qr Scanner'),
            ),
          ],
        ),
      ),
    );
  }
}
