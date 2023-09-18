import 'package:flutter/material.dart';

import '../../configs/colors.dart';
import '../../configs/screen.dart';

class HistoryItem extends StatelessWidget {

  final String product_name, imgUrl;
  final int qte, type;

  const HistoryItem({super.key, required this.product_name, required this.imgUrl, required this.qte, required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Card(
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

              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  type == 1?
                  Icon(Icons.arrow_circle_up, color: Colors.green, size: hauteur(context, 15),):
                  Icon(Icons.arrow_circle_down, color: Colors.red, size: hauteur(context, 15),),
                  Text(
                    "$qte",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: hauteur(context, 16),
                      fontWeight: FontWeight.normal
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: largeur(context, 5)),
          child: Text("28/08/2023 12:32:44", style: TextStyle(color: textGreyColor, fontSize: hauteur(context, 11)),),
        )
      ],
    );
  }
}
