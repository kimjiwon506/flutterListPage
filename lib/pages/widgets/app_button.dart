import 'package:flutter/material.dart';
import 'package:flutter_application_0612/misc/colors.dart';
import 'package:flutter_application_0612/pages/widgets/app_text.dart';

class AppButtons extends StatefulWidget {
  final Color color;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  String text;
  IconData? icon;
  bool? isIcon;
  final VoidCallback? onPressed;
  AppButtons(
      {super.key,
      this.isIcon = false,
      this.icon,
      this.text = "hi",
      required this.color,
      required this.backgroundColor,
      required this.size,
      required this.borderColor,
      this.onPressed});

  @override
  State<AppButtons> createState() => _AppButtonsState();
}

class _AppButtonsState extends State<AppButtons> {
  bool isButtonClicked = false;

  void _onButtonClicked() {
    setState(() {
      isButtonClicked = !isButtonClicked;
    });
    // widget.onPressed() P;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onButtonClicked,
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
            border: Border.all(color: widget.borderColor, width: 1.0),
            borderRadius: BorderRadius.circular(15),
            color: widget.backgroundColor),
        child: widget.isIcon == false
            ? Center(child: AppText(text: widget.text, color: widget.color))
            : Center(child: Icon(widget.icon, color: widget.color)),
      ),
    );
  }
}

// class AppButtons extends StatelessWidget {
//   final Color color;
//   final Color backgroundColor;
//   double size;
//   final Color borderColor;
//   String text;
//   IconData? icon;
//   bool? isIcon;

//   AppButtons(
//       {super.key,
//       this.isIcon = false,
//       this.icon,
//       this.text = "hi",
//       required this.color,
//       required this.backgroundColor,
//       required this.size,
//       required this.borderColor});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: size,
//       height: size,
//       decoration: BoxDecoration(
//           border: Border.all(color: borderColor, width: 1.0),
//           borderRadius: BorderRadius.circular(15),
//           color: backgroundColor),
//       child: isIcon == false
//           ? Center(child: AppText(text: text, color: color))
//           : Center(child: Icon(icon, color: color)),
//     );
//   }
// }
