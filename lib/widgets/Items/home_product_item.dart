import 'package:flutter/material.dart';

import '../../configs/colors.dart';
import '../../configs/screen.dart';

class HomeProductItem extends StatelessWidget {

  final String product_name, inBox, outBox;

  const HomeProductItem({super.key, required this.product_name, required this.inBox, required this.outBox});

  @override
  Widget build(BuildContext context) {
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
                  )
              )
            ],
          ),
        ),
      ),

      onTap: (){

      },

    );
  }
}
