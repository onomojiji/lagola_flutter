import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../configs/colors.dart';
import '../configs/screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoActivityIndicator(
              radius: hauteur(context, 20),
              color: primaryColor,
              animating: true,
            ),
            SizedBox(
              height: largeur(context, 10),
            ),
            const Text("Veuillez patienter...")
          ],
        ),
      ),
    );
  }
}