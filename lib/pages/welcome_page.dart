import 'package:flutter/material.dart';
import 'package:flutter_application_0612/cubit/app_cubits.dart';
import 'package:flutter_application_0612/misc/colors.dart';
import 'package:flutter_application_0612/pages/widgets/app_large_text.dart';
import 'package:flutter_application_0612/pages/widgets/app_text.dart';
import 'package:flutter_application_0612/pages/widgets/responsive_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome_1.png",
    "welcome_2.png",
    "welcome_3.png",
  ];
  List welcomTitle = [
    "01 shopping",
    "02 shopping",
    "03 shopping",
  ];
  List welcomSubTitle = [
    "shoppingSubTitle01",
    "shoppingSubTitle02",
    "shoppingSubTitle03",
  ];
  List welcomDesc = [
    "There are different types of careers you can pursue in your life.",
    "There are different types of careers you can pursue in your life.",
    "There are different types of careers you can pursue in your life.",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // PageView.builder => 페이지를 슬라이드로 볼 수 있도록
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/${images[index]}"),
                      fit: BoxFit.cover)),
              child: Container(
                margin: const EdgeInsets.only(
                    top: 500, left: 30, right: 30, bottom: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(text: welcomTitle[index]),
                          const SizedBox(height: 10),
                          AppText(text: welcomSubTitle[index], size: 20),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 250,
                            child: AppText(
                              text: welcomDesc[index],
                              color: AppColors.textColor1,
                              size: 16,
                            ),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<AppCubits>(context).getData();
                            },
                            child: Container(
                              width: 200,
                              child: Row(children: [
                                ResponsiveButton(
                                  width: 120,
                                ),
                              ]),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: List.generate(3, (indexDots) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            width: 8,
                            height: index == indexDots ? 25 : 8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: index == indexDots
                                    ? AppColors.mainColor
                                    : AppColors.textColor1.withOpacity(0.5)),
                          );
                        }),
                      ),
                    ]),
              ),
            );
          }),
    );
  }
}
