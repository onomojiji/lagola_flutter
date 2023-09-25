import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagola_flutter/screens/LoginScreen.dart';

import '../configs/screen.dart';
import 'noInternetScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool isinternetavailable = false;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState

    isinternetconnected().then((value){
      setState(() {
        isinternetavailable = value;
      });
    });

    super.initState();
    Future.delayed(
      const Duration(seconds: 3),

          () {
         isinternetavailable ?
          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
              builder: (context) => const LoginScreen(),
            )):
          Navigator.pushReplacement(
              context,
              CupertinoPageRoute(
                builder: (context) => const NoInternetScreen(),
              ));
      }
    );
  }

  Future<bool> isinternetconnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      print('not connected');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
            height: hauteur(context, 250),
            width: largeur(context, 250),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/logo_lagola.png"),
              ),
            )
        )
      ),
    );
  }
}
