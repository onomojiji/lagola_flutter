import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lagola_flutter/configs/colors.dart';
import 'package:lagola_flutter/configs/screen.dart';

import '../../styles/primary_button_style.dart';
import '../Inputs/number_input.dart';
import '../LoadingIndicatorDialog.dart';
import '../snackbars/primary_snack_notification.dart';

class SupplyProductItem extends StatelessWidget {

  final String product_name, imgUrl;
  final int count;

  const SupplyProductItem({super.key, required this.product_name, required this.imgUrl, required this.count});

  @override
  Widget build(BuildContext context) {

    final quantityController = TextEditingController();

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: primaryColor,
        ),
        borderRadius: BorderRadius.circular(hauteur(context, 5)),
      ),
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: hauteur(context, 5)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(hauteur(context, 5))
        ),
        child: ListTile(
            onTap: (){
              showModalBottomSheet(
                context: context,
                isDismissible: true, // ceci veut dire qu'on peut fermer le modal sur un clic à l'extérieur de celui ci.
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(hauteur(context, 20)),
                      topLeft: Radius.circular(hauteur(context, 20)),
                    )),
                builder: (context) {
                return Container(
                  // height: screenHeight(context) / 4,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: hauteur(context, 10), horizontal: largeur(context, 20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "Approvisionnement",
                            style: TextStyle(
                                color: textBoldColor,
                                fontSize: hauteur(context, 20),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: hauteur(context, 10),),
                        Center(
                          child: Text(
                            product_name,
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: hauteur(context, 15),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: hauteur(context, 10),),
                        NumberInput(
                          hint: "Entrez la quantité",
                          controller: quantityController,
                          focus: true,
                        ),
                        SizedBox(height: hauteur(context, 10),),
                        ElevatedButton(
                          onPressed: () {
                            LoadingIndicatorDialog().show(context);
                            Future.delayed(const Duration(seconds: 5), (){
                              Navigator.pop(context);
                              LoadingIndicatorDialog().dismiss();
                              primarySnackNotification(context, "Approvisionnement enregistrée avec succès..");
                            });
                          },
                          style: primaryButtonStyle(),
                          child: const Text("Valider"),
                        ),
                      ],
                    ),
                  ),
                );
              },);
            },
          title: Text(
              product_name,
            style: TextStyle(
              fontSize: hauteur(context, 17),
              fontWeight: FontWeight.normal,
              color: textGreyColor,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          leading: Container(
            height: hauteur(context, 60),
            width: largeur(context, 60),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imgUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),

          trailing: Container(
            height: double.maxFinite,
            width: largeur(context, 50),
            decoration: BoxDecoration(
              color: primaryColor
            ),
            child: Center(
              child: Text(
                  "$count",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: hauteur(context, 16)
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
