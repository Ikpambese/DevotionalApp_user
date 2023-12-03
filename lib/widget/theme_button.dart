// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ThemeButton extends StatelessWidget {
  String? label;
  Function onClick;
  Color color;
  Color? highlight;
  Widget? icon;
  Color borderColor;
  Color labelColor;
  double borderWidth;

  ThemeButton(
      {this.label,
      this.labelColor = Colors.white,
      this.color = Colors.deepPurple,
      this.highlight = Colors.amber,
      this.icon,
      this.borderColor = Colors.transparent,
      this.borderWidth = 4,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 10, bottom: 20),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Material(
            color: color,
            child: InkWell(
              splashColor: highlight,
              highlightColor: highlight,
              onTap: () {
                onClick();
              },
              child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border:
                          Border.all(color: borderColor, width: borderWidth)),
                  child: icon == null
                      ? Text(label!,
                          style: TextStyle(
                              fontSize: 16,
                              color: labelColor,
                              fontWeight: FontWeight.bold))
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            icon!,
                            SizedBox(width: 10),
                            Text(label!,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: labelColor,
                                    fontWeight: FontWeight.bold)),
                          ],
                        )),
            ),
          )),
    );
  }
}
