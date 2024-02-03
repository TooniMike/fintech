import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
   final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final bool? obscureText;
  final Widget? suffixIcon;
  final InputBorder? borderDecoration;
  final String labelText;
  final bool? autofocus;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
    final bool? passwordValidation;

  const CustomTextFormField({
    required this.textInputAction,
    required this.labelText,
    required this.keyboardType,
    required this.controller,
    super.key,
    this.onChanged,
    this.validator,
    this.obscureText,
    this.suffixIcon,
    this.onEditingComplete,
    this.autofocus,
    this.focusNode, this.borderDecoration,
    this.passwordValidation = false,
    
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        focusNode: focusNode,
        onChanged: onChanged,
        autofocus: autofocus ?? false,
        // validator: validator,
        obscureText: obscureText ?? false,
        validator: passwordValidation == true ? validatePassword : validator,
        
        obscuringCharacter: '*',
        onEditingComplete: onEditingComplete,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.h),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.h),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
        ),
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
              
      ),
    );
  }

    String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    // Define your password requirements
    final RegExp passwordRegex =
        RegExp(r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$');

    if (!passwordRegex.hasMatch(value)) {
      return 'Password must be at least 8 characters long';
    }

    return null; // Password is valid
  }
}
