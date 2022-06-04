import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

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
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detail = state as DetailState;
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
                                image: NetworkImage("http://mark.bslmeiyu.com/uploads/"+detail.place.img),
                                fit: BoxFit.cover)),
                      )),
                  Positioned(
                      left: 20,
                      top: 30,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              BlocProvider.of<AppCubits>(context).goHome();
                            },
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
                                text: detail.place.name,
                                color: Colors.black.withOpacity(0.8),
                              ),
                              AppLargeText(
                                text: "\$"+detail.place.price.toString(),
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
                                text:detail.place.location,
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
                                    color: index < detail.place.stars
                                        ? AppColors.starColor
                                        : AppColors.TextColor2,
                                  );
                                }),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              AppText(
                                text: "(5.0)",
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
                            size: 28,
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
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    backgroundColor: selectedIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                    size: 50,
                                    borderColor: selectedIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                    icon: Icons.favorite_border,
                                    //isIcon: true,
                                    text: (index + 1).toString(),
                                    // isIcon: false,
                                  ),
                                ),
                              );
                            }),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          AppLargeText(
                            text: "Description",
                            color: Colors.black.withOpacity(0.8),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AppText(
                            text:
                                detail.place.description,
                            size: 18,
                            color: AppColors.mainTextColor,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 25,
                      left: 20,
                      right: 20,
                      child: Row(
                        children: [
                          AppButtons(
                            color: AppColors.TextColor1,
                            backgroundColor: Colors.white,
                            size: 60,
                            borderColor: AppColors.TextColor1,
                            isIcon: true,
                            icon: Icons.favorite_border,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          ResponsiveButton(
                            isResponsive: true,
                          )
                        ],
                      )),
                ],
              )),
        ),
      );
    });
  }
}
