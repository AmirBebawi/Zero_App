import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

class DefaultTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const DefaultTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize:10.sp,
          color: HexColor('A0331A'),
        ),
      ),
    );
  }
}
