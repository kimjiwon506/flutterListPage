import 'package:flutter/material.dart';
import 'package:flutter_application_0612/misc/colors.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;

  ResponsiveButton({super.key, this.width, this.isResponsive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 2)
          ],
          borderRadius: BorderRadius.circular(10),
          color: AppColors.buttonBackground),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset("assets/images/arrow.png")]),
    );
  }
}
