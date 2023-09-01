// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../configs/colors.dart';
import '../../configs/screen.dart';

class SelectInput extends StatefulWidget {

  late String defaultvalue;

  final List<DropdownMenuItem<String>>  listItem;

  SelectInput({Key? key, required this.defaultvalue, required this.listItem}) : super(key: key);

  @override
  State<SelectInput> createState() => _SelectInputState();
}

class _SelectInputState extends State<SelectInput> {

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
                child: DropdownButton(
                  items: widget.listItem,
                  value: widget.defaultvalue,
                  focusColor: Colors.white,
                  isExpanded: true,
                  underline: SizedBox(),
                  onChanged: (String? value) {
                    setState(() {
                      widget.defaultvalue = value!;
                    });},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
