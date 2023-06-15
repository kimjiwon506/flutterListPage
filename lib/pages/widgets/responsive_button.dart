import 'package:flutter/material.dart';
import 'package:flutter_application_0612/misc/colors.dart';
import 'package:flutter_application_0612/pages/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  final Color color;

  ResponsiveButton(
      {super.key,
      this.width = 120,
      this.isResponsive = false,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 2)
            ],
            borderRadius: BorderRadius.circular(10),
            color: AppColors.buttonBackground),
        child: Row(
            mainAxisAlignment: isResponsive == true
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              isResponsive == true
                  ? Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: AppText(
                        text: "book",
                        color: color,
                      ),
                    )
                  : Container(),
              Image.asset("assets/images/arrow.png")
            ]),
      ),
    );
  }
}
