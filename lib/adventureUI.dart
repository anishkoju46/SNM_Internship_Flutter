import 'package:flutter/material.dart';

class AdventureUI extends StatefulWidget {
  const AdventureUI({super.key});

  @override
  State<AdventureUI> createState() => _AdventureUIState();
}

class _AdventureUIState extends State<AdventureUI> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffEF5C59),
        //BODY CODE
        body: bodyMethod(),
        //Buttom
        bottomNavigationBar: bottomMethod(),
      ),
    );
  }

  Container myHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.menu, color: Color(0xff5E606D)),
          Expanded(
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Choose your next\nadventure",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color(0xff5E606D),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ))),
          Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                //color: Colors.amber,
                borderRadius: BorderRadius.circular(25),
                image: const DecorationImage(
                    image: AssetImage("assets/images/girl.jpeg")),
              ))
        ],
      ),
    );
  }

  Container bodyMethod() {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35))),
      //padding: const EdgeInsets.only(left: 40),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              myHeader(),
              Container(
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  "Adventures by mood",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color(0xff5E606D),
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  padding: const EdgeInsets.only(left: 40),
                  child: iconScroll()),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  "We bring you the best trek you can do from\nvarious paths of the country",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: const Color(0xffD2D2D2)),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recomemded",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: const Color(0xff5E606D),
                            fontWeight: FontWeight.bold),
                      ),
                      const Text("Featured"),
                      const Text("Latest"),
                      const Text("Closest")
                    ]),
              ),
              const SizedBox(
                height: 15,
              ),
              imageMethod(),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Past adventures",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: const Color(0xff5E606D),
                                  fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 7,
                      ),
                      RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                            text: "06 SEP",
                            style: TextStyle(color: Colors.red)),
                        TextSpan(
                            text: "  Darjeeling",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: const Color(0xff5E606D),
                                    fontWeight: FontWeight.bold))
                      ])),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                                text: "05 SEP",
                                style: TextStyle(color: Colors.amber)),
                            TextSpan(
                                text: "  Gangtok",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: const Color(0xffD2D2D2)))
                          ],
                        ),
                      ),
                    ]),
              )
            ],
          ),
          //Iphone ko jasto pill button
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              alignment: Alignment.center,
              height: 6,
              width: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffD6D2DA)),
            ),
          ),
        ],
      ),
    );
  }

  Container imageMethod() {
    return Container(
      padding: const EdgeInsets.only(left: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                //First pic
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 330,
                    width: 200,
                    decoration: const BoxDecoration(
                        //color: Colors.red
                        ),
                    child: Image.asset(
                      "assets/travelPic/travel1.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                //Second pic
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 330,
                    width: 200,
                    decoration: const BoxDecoration(
                        //color: Colors.red
                        ),
                    child: Image.asset(
                      "assets/travelPic/travel4.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView iconScroll() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            aIcon(iconType: Icons.directions_walk),
            aIcon(iconType: Icons.hiking, iconColor: const Color(0xffF4626A)),
            aIcon(iconType: Icons.surfing),
            aIcon(iconType: Icons.directions_bike),
            aIcon(iconType: Icons.emoji_people),
          ]),
    );
  }

//Is is how u can make a method dymanic
  Container aIcon(
      {required IconData iconType, Color iconColor = const Color(0xff5E606D)}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffF5F8F7),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffD2D2D2),
              blurRadius: 3,
            )
          ]),
      child: Icon(
        iconType,
        color: iconColor,
      ),
    );
  }

  BottomNavigationBar bottomMethod() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xffEF5C59),
        useLegacyColorScheme: false,
        onTap: (selected) {},
        //selectedItemColor: Colors.yellow,
        // backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark,
                color: Colors.white,
              ),
              label: 'Cart'),
        ]);
  }
}
