import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lagola_flutter/configs/colors.dart';
import 'package:lagola_flutter/configs/screen.dart';

class LoadingIndicatorDialog {
  static final LoadingIndicatorDialog _singleton = LoadingIndicatorDialog._internal();
  late BuildContext _context;
  bool isDisplayed = false;

  factory LoadingIndicatorDialog(){
    return _singleton;
  }

  LoadingIndicatorDialog._internal();

  show(BuildContext context, {String text = "Veuillez patienter"}){
    if(isDisplayed){
      return;
    }
    showDialog <void> (
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          _context = context;
          isDisplayed = true;

          return WillPopScope(
              onWillPop: () async => false,
            child: SimpleDialog(
              backgroundColor: Colors.black.withOpacity(0.0),
              elevation: 0,
              children: [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                        Padding(
                            padding: EdgeInsets.only(left: largeur(context, 16), right: largeur(context, 16), bottom: hauteur(context, 16), top: hauteur(context, 16)),
                          child: CircularProgressIndicator(
                            strokeWidth: largeur(context, 6.8),
                            color: primaryColor,
                          ),
                        ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: largeur(context, 16), vertical: hauteur(context, 16)),
                        child: Text(text, style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  ),
                )
              ],

            ),
          );
      }
    );
  }

  dismiss(){
    if(isDisplayed){
      Navigator.of(_context).pop();
      isDisplayed = false;
    }
  }

}