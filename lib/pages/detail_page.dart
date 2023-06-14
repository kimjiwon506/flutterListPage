import 'package:flutter/material.dart';
import 'package:flutter_application_0612/misc/colors.dart';
import 'package:flutter_application_0612/pages/widgets/app_large_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 360,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/human1.png"),
                        fit: BoxFit.cover)),
              )),
          Positioned(
              left: 20,
              top: 50,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.menu),
                      color: Colors.white),
                ],
              )),
          Positioned(
              top: 320,
              child: Container(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(
                        text: "Yosemite",
                        size: 25,
                        color: Colors.black.withOpacity(0.7),
                      ),
                      AppLargeText(
                        text: "23-06-14",
                        size: 25,
                        color: AppColors.textColor1,
                      )
                    ],
                  )
                ]),
              ))
        ],
      ),
    ));
  }
}
