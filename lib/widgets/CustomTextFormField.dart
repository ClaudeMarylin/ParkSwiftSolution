import 'package:flutter/material.dart';
import 'package:comparking/constants/colors.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    required this.hint,
    this.suffixIcon,
    this.onTapSuffixIcon,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.filled = false,
    this.enabled = true,
    required this.prefixIcon,
  }) : super(key: key);
  String hint;
  IconData prefixIcon;
  IconData? suffixIcon;
  VoidCallback? onTapSuffixIcon;
  bool filled;
  bool obscureText;
  bool enabled;

  String? Function(String?)? validator;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
          onChanged: onChanged,
          validator: validator,
          obscureText: obscureText,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: const BorderSide(color: dRed),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: const BorderSide(color: dRed)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: const BorderSide(color: Colors.red)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: const BorderSide(color: Colors.red)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: const BorderSide(color: Colors.red)),
            hintText: hint,
            hintStyle: const TextStyle(
              fontFamily: "Inter",
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            prefixIcon: Icon(
              prefixIcon,
              color: Colors.black,
            ),
            suffixIcon: IconButton(
              icon: Icon(suffixIcon, color: Colors.black),
              onPressed: onTapSuffixIcon,
            ),
            filled: filled,
            enabled: enabled,
          ),
        ));
  }
}
