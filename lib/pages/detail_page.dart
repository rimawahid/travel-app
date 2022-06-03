import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
                    image: AssetImage("img/mountains.jpg"),fit: BoxFit.cover)
                ),
              )),
              Positioned(
                left: 20,
                top: 70,
                child: Row(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.menu),
                  color: Colors.white,), 
                ],
              )),
              Positioned(
                top: 320,
                child: Container(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
                  width:MediaQuery.of(context).size.width,
                  height: 650,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(text: "Yosemite",color: Colors.black.withOpacity(0.8),),
                          AppLargeText(text: "\$ 250", color: AppColors.mainColor,)
                        ],
                      )
                    ],
                  ),),
                  )
            ],
           )),
      ),
    );
  }
}
