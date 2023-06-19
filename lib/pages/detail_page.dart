import 'package:flutter/material.dart';
import 'package:flutter_application_0612/cubit/app_cubit_states.dart';
import 'package:flutter_application_0612/cubit/app_cubits.dart';
import 'package:flutter_application_0612/misc/colors.dart';
import 'package:flutter_application_0612/pages/widgets/app_button.dart';
import 'package:flutter_application_0612/pages/widgets/app_large_text.dart';
import 'package:flutter_application_0612/pages/widgets/app_text.dart';
import 'package:flutter_application_0612/pages/widgets/responsive_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detail = state as DetailState;
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
                          image: NetworkImage(
                              "http://mark.bslmeiyu.com/uploads/" +
                                  detail.place.img),
                          fit: BoxFit.cover)),
                )),
            Positioned(
                left: 20,
                top: 50,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
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
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                              text: detail.place.name,
                              size: 25,
                              color: Colors.black.withOpacity(0.7),
                            ),
                            AppLargeText(
                              text: "\$" + detail.place.price.toString(),
                              size: 25,
                              color: AppColors.textColor1,
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: AppColors.mainColor,
                            ),
                            SizedBox(height: 5),
                            AppText(
                                text: detail.place.location,
                                color: AppColors.textColor1),
                            SizedBox(height: 20),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return Icon(Icons.star,
                                    color: index < detail.place.stars
                                        ? AppColors.mainColor
                                        : Colors.grey);
                              }),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            AppText(
                              text: "(5.0)",
                              color: AppColors.textColor1,
                            )
                          ],
                        ),
                        SizedBox(height: 25),
                        AppLargeText(
                          text: "people",
                          color: Colors.black.withOpacity(0.7),
                          size: 22,
                        ),
                        SizedBox(height: 5),
                        AppText(
                          text: "Number of peoplee in your group",
                          color: AppColors.textColor2,
                        ),
                        SizedBox(height: 10),
                        Wrap(
                          children: List.generate(5, (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: AppButtons(
                                    size: 50,
                                    backgroundColor: selectedIndex == index
                                        ? AppColors.mainColor
                                        : Colors.grey.withOpacity(0.2),
                                    borderColor: selectedIndex == index
                                        ? AppColors.mainColor
                                        : Colors.grey.withOpacity(0.2),
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    text: (index + 1).toString()),
                              ),
                            );
                          }),
                        ),
                        SizedBox(height: 20),
                        AppLargeText(
                            text: "Description",
                            color: Colors.black.withOpacity(0.8)),
                        SizedBox(height: 10),
                        AppText(text: detail.place.description, lineHeight: 1.2)
                      ]),
                )),
            Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    AppButtons(
                        color: AppColors.textColor1,
                        backgroundColor: Colors.white,
                        size: 60,
                        borderColor: AppColors.textColor1,
                        isIcon: true,
                        icon: Icons.favorite_border),
                    SizedBox(width: 20),
                    ResponsiveButton(
                      isResponsive: true,
                      color: AppColors.mainColor,
                    ),
                  ],
                ))
          ],
        ),
      ));
    });
  }
}
