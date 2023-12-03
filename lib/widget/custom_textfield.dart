// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  late final TextEditingController? controller;
  final TextInputType? keyboard;
  final IconData? data;
  final String? hintText;
  bool? isObscure = true;
  String? textValue;
  bool? enabled = true;
  CustomTextField({
    this.controller,
    this.data,
    this.hintText,
    this.enabled,
    this.isObscure,
    this.keyboard,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter value';
          }
          return null;
        },
        onSaved: (newValue) {
          controller!.text = newValue!;
        },
        keyboardType: keyboard,
        enabled: enabled,
        controller: controller,
        obscureText: isObscure!,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            data,
            color: Color.fromARGB(255, 13, 71, 161),
          ),
          focusColor: Theme.of(context).primaryColor,
          hintText: hintText,
        ),
      ),
    );
  }
}
