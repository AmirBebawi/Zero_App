import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final dynamic validate;
  final String label;
  final IconData prefix;
  final dynamic onSubmit;
  final dynamic onChange;
  final VoidCallback? onTap;
  final bool isShown;
  final IconData? suffix;
  final VoidCallback? suffixPressed;
  final bool isClickable;

  const LoginTextFormField({
    super.key,
    required this.controller,
    required this.type,
    required this.validate,
    required this.label,
    required this.prefix,
    this.onSubmit,
    this.onChange,
    this.onTap,
    this.isShown = false,
    this.suffix,
    this.suffixPressed,
    this.isClickable = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(),
      controller: controller,
      keyboardType: type,
      obscureText: isShown,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelStyle: const TextStyle(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.h),
          ),
          borderSide: const BorderSide(),
        ),
        hintText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
    );
  }
}
