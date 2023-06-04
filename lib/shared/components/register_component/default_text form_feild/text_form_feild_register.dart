import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RegisterTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final dynamic validate;
  final String ? hint;
  final IconData ?prefix;
  final dynamic onSubmit;
  final dynamic onChange;
  final VoidCallback? onTap;
  final bool isShown;
  final IconData? suffix;
  final VoidCallback? suffixPressed;
  final bool isClickable;

  const RegisterTextFormField({super.key,
    required this.controller,
    required this.type,
    required this.validate,
     this.hint,
     this.prefix,
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
    return Padding(
      padding:const EdgeInsetsDirectional.only(top: 20,),
      child: TextFormField(

        style: const TextStyle(
          color: Colors.white
        ),
        controller: controller,
        keyboardType: type,
        obscureText: isShown,
        enabled: isClickable,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        onTap: onTap,
        validator: validate,
        decoration: InputDecoration(

          hintStyle: const TextStyle(
            color: Colors.white
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius:  BorderRadius.all(
              Radius.circular(15.h),
            ),
            borderSide: const BorderSide(
              color: Colors.white
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius:  BorderRadius.all(
              Radius.circular(15.h),
            ),
            borderSide: const BorderSide(
                color: Colors.white
            ),
          ),
          hintText:hint ,
          prefixIcon: Icon(
            prefix,
          ),
          suffixIcon: suffix != null
              ? IconButton(
            onPressed: suffixPressed,
            icon: Icon(
              suffix,
              color: Colors.white,
            ),
          )
              : null,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
