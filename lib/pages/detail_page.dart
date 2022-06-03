import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      height: 350,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("img/mountains.jpg"),
                              fit: BoxFit.cover)),
                    )),
                Positioned(
                    left: 20,
                    top: 70,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.menu),
                          color: Colors.white,
                        ),
                      ],
                    )),
                Positioned(
                  top: 320,
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 650,
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
                              text: "Yosemite",
                              color: Colors.black.withOpacity(0.8),
                            ),
                            AppLargeText(
                              text: "\$ 250",
                              color: AppColors.mainColor,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.mainColor,
                            ),
                            SizedBox(
                              width: 0,
                            ),
                            AppText(
                              text: "USA , California",
                              color: AppColors.TextColor1,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return Icon(
                                  Icons.star,
                                  color: index < gottenStars
                                      ? AppColors.starColor
                                      : AppColors.TextColor2,
                                );
                              }),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            AppText(
                              text: "(4.0)",
                              color: AppColors.TextColor2,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        AppLargeText(
                          text: "People",
                          color: Colors.black.withOpacity(0.8),
                          size: 25,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        AppText(
                          text: "Number of people in your group",
                          color: AppColors.mainTextColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          children: List.generate(5, (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 20),
                                child: AppButtons(
                                  color: selectedIndex == index?Colors.white:Colors.black,
                                  backgroundColor:selectedIndex == index?Colors.black: AppColors.buttonBackground,
                                  size: 50,
                                  borderColor:selectedIndex == index? Colors.black:AppColors.buttonBackground,
                                  icon: Icons.favorite_border,
                                  //isIcon: true,
                                  text: (index + 1).toString(),
                                  // isIcon: false,
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
