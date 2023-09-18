import 'package:flutter/material.dart';
import 'package:lagola_flutter/widgets/Inputs/number_input.dart';
import 'package:lagola_flutter/widgets/LoadingIndicatorDialog.dart';
import 'package:lagola_flutter/widgets/snackbars/primary_snack_notification.dart';

import '../../configs/colors.dart';
import '../../configs/screen.dart';
import '../../styles/primary_button_style.dart';

class HomeProductItem extends StatelessWidget {

  final String product_name, inBox, outBox;

  const HomeProductItem({super.key, required this.product_name, required this.inBox, required this.outBox});

  @override
  Widget build(BuildContext context) {

    final quantityController = TextEditingController();

    return InkWell(
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(hauteur(context, 5)),
        ),
        child: Container(
          padding: EdgeInsets.only(bottom: hauteur(context, 10),),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(hauteur(context, 10))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                  flex : 5,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/burger.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
              ),
              Flexible(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: largeur(context, 5)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Text(
                              product_name,
                              style: TextStyle(
                                color: textBoldColor,
                                fontWeight: FontWeight.normal,
                                fontSize: hauteur(context, 18),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  inBox,
                                  style: TextStyle(
                                      color: textGreyColor,
                                      fontSize: hauteur(context, 12),
                                      fontWeight: FontWeight.bold
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  outBox,
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: hauteur(context, 12),
                                      fontWeight: FontWeight.bold
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      ),

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
                            "Vente",
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
                              primarySnackNotification(context, "Vente enregistrée avec succès..");
                            });
                          },
                          style: primaryButtonStyle(),
                          child: const Text("Valider"),
                        ),
                      ],
                    ),
                  ),
                );
              },
          );
      },

    );
  }
}
