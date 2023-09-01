import 'package:flutter/material.dart';

import '../../configs/colors.dart';
import '../../configs/screen.dart';

class TextInput extends StatefulWidget {

  final String hint;
  late bool hide, focus;
  final IconData? icon;
  final TextEditingController controller;

  final bool? visibleIcon;

  TextInput({Key? key, required this.hint, required this.hide, required this.focus, this.icon, required this.controller, this.visibleIcon}) : super(key: key);

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
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
            side: BorderSide(color: textGreyColor, width: largeur(context, 1)),
          ),
          title: Row(
            children: [
              Expanded(
                  child: TextFormField(
                    obscureText: widget.hide,
                    autofocus: widget.focus,
                    keyboardType: TextInputType.text,
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.hint,
                        icon: Icon(widget.icon, color: primaryColor,)
                    ),
                    controller: widget.controller,
                  )),
            ],
          ),
          
          trailing: widget.visibleIcon != null ? IconButton(
              onPressed: (){
                setState(() {
                  widget.hide = !widget.hide;
                });
              }, 
              icon: widget.hide? Icon(
                Icons.visibility_off,
                size: hauteur(context, 25),
                color: primaryColor,
              ) : Icon(
                  Icons.visibility,
                  size: hauteur(context, 25),
                  color: primaryColor,
              )
          ) 
              : null,
        ),
      ],
    );
  }
}
