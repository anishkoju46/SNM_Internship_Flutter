import 'dart:math';
import 'package:crud_login/smooth_Page_Indicator.dart';
//import 'package:crud_login/stateLessIndicator.dart';
import 'package:flutter/material.dart';
//import 'package:get_storage/get_storage.dart';
//import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Avatar extends StatefulWidget {
  const Avatar(
      {super.key,
      this.items,
      this.headerBackgroundColor,
      this.iconBackgroundColor,
      this.indicatorColor,
      this.levelColor});
  final Color? headerBackgroundColor;
  final Color? iconBackgroundColor;
  final Color? indicatorColor;
  final Color? levelColor;
  final List<
      ({
        String avatarImagePath,
        String avatarName,
        IconData firstIcon,
        IconData secondIcon,
        String firstImage,
        String secondImage,
        String levels,
      })>? items;
  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.items == null || widget.items!.isEmpty) {
      recordAvatar = [
        (
          avatarImagePath: "assets/images/don.png",
          avatarName: "Avatar Jr",
          firstIcon: Icons.security,
          secondIcon: Icons.air,
          firstImage: "assets/images/knife.jpeg",
          secondImage: "assets/images/katana.jpeg",
          levels: "Level 1",
        ),
        (
          avatarImagePath: "assets/images/don.png",
          avatarName: "Avatar Sr",
          firstIcon: Icons.warning,
          secondIcon: Icons.eco,
          firstImage: "assets/images/gun.jpeg",
          secondImage: "assets/images/fire.jpeg",
          levels: "Level 2"
        ),
        (
          avatarImagePath: "assets/images/don.png",
          avatarName: "Avatar Dr",
          firstIcon: Icons.security,
          secondIcon: Icons.air,
          firstImage: "assets/images/knife.jpeg",
          secondImage: "assets/images/katana.jpeg",
          levels: "Level 3"
        ),
        (
          avatarImagePath: "assets/images/don.png",
          avatarName: "Avatar Er",
          firstIcon: Icons.security,
          secondIcon: Icons.air,
          firstImage: "assets/images/knife.jpeg",
          secondImage: "assets/images/katana.jpeg",
          levels: "Level 4"
        ),
      ];
    }
  }

  late final List<
      ({
        String avatarImagePath,
        String avatarName,
        IconData firstIcon,
        IconData secondIcon,
        String firstImage,
        String secondImage,
        String levels,
      })> recordAvatar;

  final PageController pageController = PageController();
  late int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xff834900),
      body: Column(
        children: [
          Expanded(
            child: avatarHead(context, pageController),
          ),
          windOfFate(),
          //Expanded(child: MyAvatarHome())
          //bottomIconMethod()
        ],
      ),
    ));
  }

  Container avatarHead(BuildContext context, PageController pageController) {
    double randomAngles = Random().nextDouble() * 360;
    return Container(
      //padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: widget.headerBackgroundColor ?? const Color(0xffDE9F3C),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(recordAvatar[currentIndex].levels,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        color: widget.levelColor ??
                                            const Color(0xffF2DCB7),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: (currentIndex + 1).toString(),
                                ),
                                const TextSpan(text: " of "),
                                TextSpan(
                                  text: recordAvatar.length.toString(),
                                )
                              ]),
                            )
                            // Text("5 of 10",
                            //     style: Theme.of(context)
                            //         .textTheme
                            //         .bodyMedium
                            //         ?.copyWith(
                            //             color: const Color(0xffF2DCB7),
                            //             fontWeight: FontWeight.bold,
                            //             fontSize: 16))
                          ],
                        ),
                        // MyStatelessSmoothIndicator(
                        //   pageController: pageController,
                        //   count: recordAvatar.length,
                        //   activeColor: const Color(0xffCA8226),
                        //   inActiveColor: const Color(0xffFFCC5C),
                        // )
                        MyCustomSmoothPageIndicator(
                          pageController: pageController,
                          count: recordAvatar.length,
                          activeColor:
                              widget.indicatorColor ?? const Color(0xffCA8226),
                          inActiveColor: const Color(0xffFFCC5C),
                          pageScrollDuration: const Duration(milliseconds: 200),
                        )
                        // SmoothPageIndicator(
                        //   controller: pageController,
                        //   count: recordAvatar.length,
                        //   effect: const WormEffect(
                        //       dotColor: Colors.white,
                        //       dotWidth: 15,
                        //       dotHeight: 7,
                        //       activeDotColor: Colors.amber),
                        //   onDotClicked: (index) {
                        //     pageController.animateToPage(index,
                        //         duration: const Duration(milliseconds: 300),
                        //         curve: Curves.linear);
                        //   },
                        // )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        // height: 40,
                        // width: 40,
                        decoration: BoxDecoration(
                            color: widget.levelColor ?? const Color(0xffFFC95B),
                            shape: BoxShape.circle),
                        child: const RotatedBox(
                          quarterTurns: 1,
                          child: Icon(
                            Icons.tune,
                            color: Color(0xffCA8226),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Container(
          //   //color: Colors.white,
          //   padding: const EdgeInsets.symmetric(vertical: 80),
          //   child: Column(
          //     children: [
          //       Text("Avatar Jr",
          //           style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          //               color: const Color(0xffF2DCB7),
          //               fontWeight: FontWeight.bold,
          //               fontSize: 35)),
          //       Text("Level 2",
          //           style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          //               color: const Color(0xffD08A2D),
          //               fontWeight: FontWeight.bold,
          //               fontSize: 16)),
          //     ],
          //   ),
          // ),
          //Photo
          Expanded(
            flex: 7,
            child: Stack(
              children: [
                PageView(
                  onPageChanged: (value) {
                    currentIndex = value;
                    setState(() {});
                  },
                  controller: pageController,
                  children: recordAvatar
                      .asMap()
                      .entries
                      .map((e) => Column(
                            children: [
                              Wrap(
                                children: [
                                  Text(e.value.avatarName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              color: const Color(0xffF2DCB7),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 35)),
                                  Text(e.value.avatarName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              color: const Color(0xffF2DCB7),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 35)),
                                ],
                              ),
                              Text(e.value.levels,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: widget.levelColor ??
                                              const Color(0xffD08A2D),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.all(30),
                                  decoration: BoxDecoration(
                                    //color: Colors.orange,
                                    image: DecorationImage(
                                        image:
                                            AssetImage(e.value.avatarImagePath),
                                        fit: BoxFit.contain),
                                  ),
                                ),
                              ),
                            ],
                          ))
                      .toList(),
                ),
                //Use of Spread Operator
                ...[
                  stackItems(
                    left: 20,
                    top: 220,
                    imageOrIcon: recordAvatar[currentIndex].firstImage,
                    angle: randomAngles,
                  ),
                  stackItems(
                    left: 20,
                    top: 350,
                    imageOrIcon: recordAvatar[currentIndex].secondImage,
                    angle: randomAngles,
                  ),
                  stackItems(
                    right: 20,
                    top: 240,
                    imageOrIcon: recordAvatar[currentIndex].firstIcon,
                    iconColor: const Color(0xffC87E22),
                    iconBackground:
                        widget.iconBackgroundColor ?? const Color(0xffFDD88A),
                    angle: randomAngles,
                  ),
                  stackItems(
                    right: 20,
                    top: 350,
                    imageOrIcon: recordAvatar[currentIndex].secondIcon,
                    iconColor: const Color(0xffC87E22),
                    iconBackground:
                        widget.iconBackgroundColor ?? const Color(0xffFDD88A),
                    angle: randomAngles,
                  )
                ].reversed.toList()
                //Use of Cascade Operator
              ],
            ),
          ),
        ],
      ),
    );
  }

  Positioned stackItems({
    double? right,
    double? left,
    double? top,
    double height = 70,
    double width = 70,
    double? bottom,
    //IconData? icon,
    Color? iconColor,
    Color? iconBackground,
    dynamic imageOrIcon,
    required double angle,
  }) {
    return Positioned(
      right: right,
      left: left,
      top: top,
      height: height,
      width: width,
      bottom: bottom,
      child: AnimatedRotation(
        duration: const Duration(milliseconds: 300),
        turns: angle * (3.1415927 / 180),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(255, 134, 97, 44),
                  blurStyle: BlurStyle.outer,
                  blurRadius: 7),
            ],
            shape: BoxShape.rectangle,
            color: iconBackground,
            image: imageOrIcon is String
                ? DecorationImage(
                    image: AssetImage(imageOrIcon),
                  )
                : null,
          ),
          child: imageOrIcon is IconData
              ? Icon(imageOrIcon, color: iconColor)
              : null,
        ),
      ),
    );
  }

  Container windOfFate() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      //width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xffCA8226),
          border: Border.all(color: const Color(0xffC87F24), width: 1),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25))),
      child: const Row(children: [
        Icon(
          Icons.air,
          color: Color(0xffE3AC57),
        ),
        Text(
          "Wind of fate",
          style: TextStyle(
              color: Color(0xffFDFBF8), overflow: TextOverflow.ellipsis),
          maxLines: 2,
        ),
        // const Icon(
        //   Icons.arrow_forward_ios,
        //   size: 64,
        //   color: Colors.amber,
        // ),
        // Container(
        //   height: 60,
        //   width: 20,
        //   decoration: const BoxDecoration(color: Color(0xffE29D3A)),
        // )
      ]),
    );
  }
}
