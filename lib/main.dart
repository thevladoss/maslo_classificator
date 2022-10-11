import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:maslo_detector/screens/main_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  runApp(MasloApp(cameras: cameras));
}

class MasloApp extends StatelessWidget {
  final List<CameraDescription> cameras;

  const MasloApp({required this.cameras, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: 'maslo_classifier',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: MainScreen(cameras: cameras),
    );
  }
}
