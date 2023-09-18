import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lagola_flutter/configs/colors.dart';
import 'package:lagola_flutter/configs/screen.dart';

class SupplyProductItem extends StatelessWidget {

  final String product_name, imgUrl;
  final int count;

  const SupplyProductItem({super.key, required this.product_name, required this.imgUrl, required this.count});

  @override
  Widget build(BuildContext context) {
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
