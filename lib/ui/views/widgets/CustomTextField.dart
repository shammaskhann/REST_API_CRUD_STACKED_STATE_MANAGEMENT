import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../login/login_viewmodel.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObsecure;
  final Function? togglePasswordVisibility;
  const CustomTextField(
      {required this.hintText,
      required this.controller,
      required this.isObsecure,
      this.togglePasswordVisibility});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObsecure,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.black,
              )),
          suffixIcon: hintText == 'Password'
              ? IconButton(
                  onPressed: () => togglePasswordVisibility!(),
                  icon: Icon(
                    isObsecure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black,
                  ),
                )
              : null),
    );
  }
}
