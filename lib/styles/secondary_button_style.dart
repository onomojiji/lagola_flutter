import 'package:flutter/material.dart';

import '../configs/colors.dart';

ButtonStyle secondaryButtonStyle (){
  return ElevatedButton.styleFrom(
    elevation: 5, backgroundColor: textGreyColor,
    minimumSize: const Size.fromHeight(50),

  );
}