import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lagola_flutter/configs/colors.dart';
import 'package:lagola_flutter/configs/screen.dart';

import '../services/dio.dart';
import '../styles/primary_button_style.dart';
import '../widgets/Inputs/number_input.dart';
import '../widgets/LoadingIndicatorDialog.dart';
import '../widgets/snackbars/danger_snack_notification.dart';
import '../widgets/snackbars/primary_snack_notification.dart';

class NewSellScreen extends StatefulWidget {

  final String user_token;

  const NewSellScreen({super.key, required this.user_token});

  @override
  State<NewSellScreen> createState() => _NewSellScreenState();
}

class _NewSellScreenState extends State<NewSellScreen> {

  final productController = TextEditingController();
  final quantityController = TextEditingController();

  String default_product_id = "1";

  List<DropdownMenuItem<String>> menuItems = [];


  sellProduct(Map creds) async {

    // open loading dialog
    LoadingIndicatorDialog().show(context);

    try{
      var response = await dio().post(
          '/sellProduct',
          data: json.encode(creds),
          options: Options(
              headers: {'Authorization' : 'Bearer ${widget.user_token}',},
              responseType: ResponseType.json,
              validateStatus: (statusCode) {
                if(statusCode == null){
                  return false;
                }if(statusCode == 404){
                  return true;
                }else{
                  return statusCode >= 200 && statusCode < 300;
                }
              }
          )
      );

      var data = response.data;

      Navigator.pop(context);

      LoadingIndicatorDialog().dismiss();

      if(data['status'] == 'success'){

        primarySnackNotification(context, data['message']);

      }else{ // informations de connexion non correctes

        dangerSnackNotification(context, data['message']);

      }

    }catch (e){
      print(e);
    }

  }

  getProducts() async {

    // open loading dialog
    LoadingIndicatorDialog().show(context);

    try{
      var response = await dio().get(
        '/getnewsell',
        options: Options(
          headers: {'Authorization' : 'Bearer ${widget.user_token}',},
          responseType: ResponseType.json,
          validateStatus: (statusCode) {
            if(statusCode == null){
              return false;
            }if(statusCode == 404){
              return true;
            }else{
              return statusCode >= 200 && statusCode < 300;
            }
          },
        ),
      );

      var data = response.data["products"];

     for(var i=0; i < data.length; i++){
       menuItems.add(
         DropdownMenuItem(value: "${data[i]["id"]}", child: Text("${data[i]["name"]}")),
       );
     }

      // close loading dialog
      LoadingIndicatorDialog().dismiss();

    }catch (e){
      print(e);
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {getProducts();});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: primaryColor),
        title: Text("Nouvelle vente", style: TextStyle(color: primaryColor),),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: hauteur(context, 20), left: largeur(context, 20), right: largeur(context, 20)),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Choisir le produit, tapez la quantité et validez", style: TextStyle(color: textBoldColor, fontSize: hauteur(context, 14)),),
                Column(
                  children: [
                    SizedBox(
                      height: hauteur(context, 10),
                    ),
                    ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(hauteur(context, 10)),
                        side: BorderSide(color: textGreyColor, width: largeur(context, 1)),
                      ),
                      title: Row(
                        children: [
                          Expanded(
                            child: DropdownButton(
                              items: menuItems,
                              focusColor: Colors.white,
                              value: default_product_id,
                              isExpanded: true,
                              underline: SizedBox(),
                              onChanged: (String? value) {
                                setState(() {
                                  default_product_id = value!;
                                });},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                NumberInput(
                  hint: "Entrez la quantité",
                  controller: quantityController,
                  focus: true,
                ),
                SizedBox(height: hauteur(context, 10),),
                ElevatedButton(
                  onPressed: () {
                    Map creds = {
                      'product_id' : default_product_id,
                      'quantity' : quantityController.value.text,
                    };

                    sellProduct(creds);
                  },
                  style: primaryButtonStyle(),
                  child: const Text("Valider"),
                ),

              ],
            ),
          ]
        ),
      ),
    );
  }
}
