import 'package:flutter/material.dart';
import 'package:lagola_flutter/configs/colors.dart';
import 'package:lagola_flutter/widgets/Inputs/number_input.dart';

import '../configs/screen.dart';
import '../styles/primary_button_style.dart';
import '../widgets/Inputs/text_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final numberController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: hauteur(context, 30)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: screenHeight(context) / 3,
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: hauteur(context, 15)),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/logo_lagola.png"),
                      fit: BoxFit.contain
                    ),
                  )
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: hauteur(context, 15),
                    left: largeur(context, 15),
                    right: largeur(context, 15)),
                child: Text(
                  "Connectez-vous pour continuer !",
                  style: TextStyle(fontSize: hauteur(context, 20), color: primaryColor, fontWeight: FontWeight.bold),
                ),
              ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: largeur(context, 15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              NumberInput(
                hint: "Numéro de téléphone",
                focus: true,
                controller: numberController,
                icon: Icons.phone_android,
              ),
              TextInput(
                hint: "Mot de passe",
                hide: true,
                focus: false,
                controller: passwordController,
                icon: Icons.lock,
                visibleIcon: true,
              ),
              Padding(
                padding:
                EdgeInsets.symmetric(vertical: hauteur(context, 10)),
                child: TextButton(
                    onPressed: () {

                    },
                    child: const Text(
                      "Mot de passe oublié ?",
                      style:
                      TextStyle(decoration: TextDecoration.underline),
                    )),
              ),
              ElevatedButton(
                onPressed: () {
                  if (numberController.value.text == '' && passwordController.value.text == ''){
                    setState(() {
                      var message = "Aucun champs renseigné";
                    });
                  }else if(numberController.value.text == '' && passwordController.value.text != ''){
                    setState(() {
                      var message = "Code eBULL-CTD non renseigné";
                    });
                  }else if(numberController.value.text != '' && passwordController.value.text == ''){
                    setState(() {
                      var message = "Mot de passe non renseigné";
                    });
                  }
                  else{

                    Map creds = {
                      'codeEbull' : numberController.value.text,
                      'password' : passwordController.value.text,
                      'device_name' : 'mobile',
                    };
                  }
                },
                style: primaryButtonStyle(),
                child: const Text("Se connecter"),
              ),
            ]
          )
        ),
         ],
          ),
        ),
      ),
    );
  }
}
