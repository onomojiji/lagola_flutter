import 'package:flutter/material.dart';

import '../configs/colors.dart';
import '../configs/screen.dart';
import '../styles/primary_button_style.dart';
import '../widgets/Inputs/number_input.dart';

class AddSellScreen extends StatefulWidget {
  const AddSellScreen({super.key});

  @override
  State<AddSellScreen> createState() => _AddSellScreenState();
}

class _AddSellScreenState extends State<AddSellScreen> {

  final qteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nouvelle vente"),
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
        elevation: 1,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white, size: hauteur(context, 20)),
      ),

      body: Padding(
        padding: EdgeInsets.all(hauteur(context, 10)),
        child: Center(
          child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: primaryColor,
              ),
              borderRadius: BorderRadius.circular(hauteur(context, 10)),
            ),
            child: Container(
              height: screenHeight(context) / 2,
              padding: EdgeInsets.symmetric(horizontal: largeur(context, 10), vertical: hauteur(context, 10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                        "Choisissez le produit et la quantité puis validez !",
                      style: TextStyle(
                        color: textGreyColor,
                        fontWeight: FontWeight.bold,
                        fontSize: hauteur(context, 16),
                      ),
                    ),
                  ),
                  NumberInput(
                    hint: "Quantité",
                    focus: true,
                    controller: qteController,
                    icon: Icons.numbers,
                  ),
                  NumberInput(
                    hint: "Quantité",
                    focus: true,
                    controller: qteController,
                    icon: Icons.numbers,
                  ),

                  ElevatedButton(
                    style: primaryButtonStyle(),
                    onPressed: () {  },
                    child: const Text("Validez"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
