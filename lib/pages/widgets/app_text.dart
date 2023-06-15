import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  double? lineHeight;
  AppText(
      {Key? key,
      this.size = 16,
      required this.text,
      this.color = Colors.grey,
      this.lineHeight = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            color: color,
            fontSize: size,
            fontWeight: FontWeight.normal,
            height: lineHeight));
  }
}
