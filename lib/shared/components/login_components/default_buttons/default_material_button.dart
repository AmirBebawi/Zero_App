import 'dart:core';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';


class LoginMaterialButton extends StatelessWidget {
  final double width;


  final bool isUpperCase;


  final VoidCallback onPressed;

  final String text;

  const LoginMaterialButton({
    super.key,
    this.width = double.infinity,
    this.isUpperCase = true,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.h,
        ),
        color: HexColor('A0331A'),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
