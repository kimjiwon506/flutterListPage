import 'package:flutter/material.dart';
import 'package:flutter_application_0612/misc/colors.dart';
import 'package:flutter_application_0612/pages/widgets/app_large_text.dart';
import 'package:flutter_application_0612/pages/widgets/app_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/app_cubit_states.dart';
import '../cubit/app_cubits.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "store1.png": "store1",
    "store2.png": "store2",
    "store3.png": "store3",
    "store4.png": "store4",
    "store5.png": "store5",
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(body: BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        if (state is LoadedState) {
          var info = state.places;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //menu text
              Container(
                padding: const EdgeInsets.only(top: 70, left: 20),
                child: Row(
                  children: [
                    const Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.black54,
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.5)),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              //discover text
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: AppLargeText(text: "ListView"),
              ),
              const SizedBox(
                height: 10,
              ),
              //tabbar
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                      labelPadding: const EdgeInsets.only(left: 20, right: 20),
                      controller: _tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: CircleTabIndicator(
                          color: AppColors.mainColor, radius: 5),
                      tabs: const [
                        Tab(text: "리스트1"),
                        Tab(text: "리스트2"),
                        Tab(text: "리스트3"),
                      ]),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 15, top: 10),
                height: 300,
                width: double.maxFinite,
                child: TabBarView(controller: _tabController, children: [
                  ListView.builder(
                    itemCount: info.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<AppCubits>(context)
                              .detailPage(info[index]);
                        },
                        child: Container(
                            margin: const EdgeInsets.only(right: 15, top: 10),
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "http://mark.bslmeiyu.com/uploads/" +
                                            info[index].img),
                                    fit: BoxFit.cover))),
                      );
                    },
                  ),
                  Text("There"),
                  Text("bye"),
                ]),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLargeText(text: "Explore more", size: 22),
                    AppText(text: "see all", color: AppColors.textColor1)
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                height: 120,
                width: double.maxFinite,
                child: ListView.builder(
                    itemCount: images.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/" +
                                            images.keys.elementAt(index)),
                                        fit: BoxFit.contain))),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: AppText(
                                  text: images.values.elementAt(index),
                                  color: AppColors.textColor2),
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          );
        } else {
          return Container();
        }
      },
    ));
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
