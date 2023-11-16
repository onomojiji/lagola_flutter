import 'package:flutter/material.dart';

import '../configs/colors.dart';

ButtonStyle primaryButtonStyle (){
  return ElevatedButton.styleFrom(
    elevation: 5, backgroundColor: primaryColor,
    minimumSize: const Size.fromHeight(50),
  );
}