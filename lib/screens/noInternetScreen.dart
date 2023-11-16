import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagola_flutter/styles/primary_button_style.dart';

import '../configs/colors.dart';
import '../configs/screen.dart';
import '../widgets/LoadingIndicatorDialog.dart';
import 'LoginScreen.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key});

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {

  bool isinternetavailable = false;

  Future<bool> isinternetconnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        LoadingIndicatorDialog().dismiss();
        Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
              builder: (context) => const LoginScreen(),
            ));
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      LoadingIndicatorDialog().dismiss();
      Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => const NoInternetScreen(),
          ));
      print('not connected');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
          child: SizedBox(
            height: screenHeight(context)/2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: hauteur(context, 200),
                    width: largeur(context, 200),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/no_internet_1.jpg"),
                        fit: BoxFit.contain
                      ),
                    )
                ),
                Text("Pas de connexion internet !", style: TextStyle(fontSize: hauteur(context, 18), color: textGreyColor),),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: largeur(context, 20)),
                  child: ElevatedButton(
                      onPressed: (){

                        LoadingIndicatorDialog().show(context);

                        isinternetconnected().then((value){
                          setState(() {
                            isinternetavailable = value;
                          });
                        });

                      },
                    style: primaryButtonStyle(),
                      child: const Text("Reéssayez"),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
