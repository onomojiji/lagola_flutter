import 'package:flutter/material.dart';

import '../../configs/colors.dart';
import '../../configs/screen.dart';

class NumberInput extends StatelessWidget {

  final String hint;
  final bool focus;

  final IconData? icon;
  final TextEditingController controller;

  NumberInput({super.key, required this.hint, this.icon, required this.controller, required this.focus});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: hauteur(context, 10),
        ),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(hauteur(context, 10)),
            side: BorderSide(color: primaryColor, width: largeur(context, 1)),
          ),
          title: Row(
            children: [
              Expanded(
                  child: TextFormField(
                    autofocus: focus,
                    keyboardType: TextInputType.number,
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hint,
                        icon: Icon(icon, color: primaryColor,)
                    ),
                    controller: controller,
                  )),
            ],
          ),

        ),
      ],
    );
  }
}
