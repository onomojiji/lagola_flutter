import 'package:flutter/material.dart';

import '../configs/colors.dart';
import '../configs/screen.dart';

class DownloadHistoryItem extends StatelessWidget {

  final String month, date;

  const DownloadHistoryItem({Key? key, required this.month, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(month, style: TextStyle(color: textBoldColor, fontSize: hauteur(context, 15)),),
                  SizedBox(height: hauteur(context, 5),),
                  Text(date, style: TextStyle(color: textGreyColor, fontSize: hauteur(context, 12)),),
                  Container(
                    height: hauteur(context, 0.25),
                    width: double.maxFinite,
                    margin: EdgeInsets.symmetric(vertical: hauteur(context, 10)),
                    color: primaryColor,
                  ),
                ],
              ),
      onTap: (){},
      );
  }
}
