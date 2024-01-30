import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:parkswift/main.dart';
import 'package:parkswift/notifs.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        /*le haut de page*/
        Expanded(
            child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                CustomTextFormField(
                    hint: "Rechercher",
                    prefixIcon: IconlyBroken.search,
                    filled: true,
                    enabled: true,
                  ),
                
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     // context,
                    //     // MaterialPageRoute(
                    //     //     builder: (context) => Notifications())
                    //     );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.notifications,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () {
                       Navigator.push(
                     context,
                    MaterialPageRoute(
                    builder: (context) => Notifications())
                    );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ))
      ]),
    )));
  }
}

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
              borderSide: const BorderSide(color: d_red),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: const BorderSide(color: d_red)),
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
