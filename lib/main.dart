import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lagola_flutter/screens/SplashScreen.dart';

import 'configs/colors.dart';

Future<void> main() async {

  // initialise flutter biding
  WidgetsFlutterBinding.ensureInitialized();

  // force only portrait device orientation
  await SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ]
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LAGOLA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: whiteColor,
          centerTitle: false,
          iconTheme: const IconThemeData(color: Colors.orange),
          elevation: 0.5,
          foregroundColor: Colors.orange,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
