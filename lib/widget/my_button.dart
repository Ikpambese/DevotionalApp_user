// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({
    super.key,
    required this.title,
    required this.color,
    required this.onpress,
    this.status,
    this.context,
  });

  final String title;
  final Color color;
  final VoidCallback onpress;
  bool? status = false;
  BuildContext? context; // Use VoidCallback instead of Function

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: MaterialButton(
        elevation: 0,
        color: status == false ? color : Colors.grey,

        onPressed:
            status == true ? null : onpress, // Now it matches the expected type
        height: 55,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            status == false ? title : 'Please wait...',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
