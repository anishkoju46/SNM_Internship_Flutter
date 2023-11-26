import 'package:crud_login/burgerClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MyBurgerHome extends StatefulWidget {
  const MyBurgerHome({super.key});

  @override
  State<MyBurgerHome> createState() => _MyBurgerHomeState();
}

class _MyBurgerHomeState extends State<MyBurgerHome> {
  Duration durationPeriod = 800.milliseconds;
  //Mathi ko List
  final List<BurgerClass> myComboMenuList = [
    BurgerClass(
        imageURL: "assets/images/burger.jpeg",
        burgerName: "Combo menu",
        burgerDesc:
            "sdfBeef 300gr,cheese cheddar,\nonion,pickled cucumber,special\nsauce,burger bun",
        burgerPrice: 24.95),
    BurgerClass(
        imageURL: "assets/images/burger.jpeg",
        burgerName: "Combo 2",
        burgerDesc:
            "Chicken 300gr,parmesan,\nonion,pickled cucumber,special\nsauce,burger bun",
        burgerPrice: 98.11),
  ];
  //Second List
  final List<BurgerClass> myBurgerList = [
    BurgerClass(
        imageURL: "assets/images/burger.jpeg",
        burgerName: "3xGoblin",
        burgerDesc:
            "Beef 600gr,cheese cheddar,\nonion,pickled cucumber,special\nsauce,burger bun",
        burgerPrice: 24.95),
    BurgerClass(
        imageURL: "assets/images/burger.jpeg",
        burgerName: "Hobbit",
        burgerDesc:
            "Beef 350gr,cheese cheddar,\nonion,pickled cucumber,special\nsauce,burger bun",
        burgerPrice: 19.95),
    BurgerClass(
        imageURL: "assets/images/burger.jpeg",
        burgerName: "Yeti Burger",
        burgerDesc:
            "Yeti 350gr, mozilera,\nonion,pickled cucumber,special\nsauce,burger bun",
        burgerPrice: 69.95)
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF202124),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello, sabere",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: Colors.amber,
                        ),
                        Text(
                          "Tbilisi , GEO",
                          //style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Container(
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                    image: DecorationImage(
                        image: AssetImage("assets/images/girl.jpeg"),
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Which burger are you eating today?",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 30,
            ),
            //This row is responsible for the menu bars
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'New',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.grey),
              ),
              Text(
                'Burgers',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.grey),
              ),
              Text(
                'Combo menu',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.grey),
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Pop',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            decorationThickness: 5,
                          )),
                  TextSpan(
                      text: 'ular',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white))
                ]),
              ),
              Text(
                'Sauces',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.grey),
              ),
            ]),
            // RichText(
            //     text: const TextSpan(children: [
            //   TextSpan(
            //       text: "New Burger Combo menu ",
            //       style: TextStyle(
            //         color: Colors.grey,
            //       )),
            //   TextSpan(
            //       text: 'Popular ',
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontWeight: FontWeight.bold,
            //       )),
            //   TextSpan(
            //       text: 'Sauces',
            //       style: TextStyle(
            //         color: Colors.grey,
            //       )),
            // ])),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Best popular",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            //comboMenu(myComboMenuList.first),
            const SizedBox(
              height: 5,
            ),
            // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            //   hobbit(myBurgerList.first),
            //   hobbit(myBurgerList.last)
            // ]),
            SizedBox(
              height: 200,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 15),
                scrollDirection: Axis.horizontal,
                itemCount: myComboMenuList.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                      width: MediaQuery.of(context).size.width * .8,
                      child: comboMenu(myComboMenuList[index]));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
              ),
            ),
            Expanded(
              //height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: myBurgerList.length,
                itemBuilder: (context, index) {
                  //return hobbit(myBurgerList[index]);
                  return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.44,
                      child: hobbit(myBurgerList[index]));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
              ),
            )
          ]),
        ),

        // //Footer section starts
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF413F45),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'cart',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.person),
            //   label: 'Profile',
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.trending_neutral),
            //   label: 'sdf',
            // ),
          ],
        ),
      ),
    );
  }

  Widget comboMenu(BurgerClass myComboMenus) {
    return Container(
      //margin: const EdgeInsets.fromLTRB(0, 10, 60, 10),
      padding: const EdgeInsets.fromLTRB(1, 10, 10, 10),
      //height: 200,
      decoration: const BoxDecoration(
        color: Color(0xFF413F45),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTapUp: (event) {
              durationPeriod = 800.milliseconds;
              setState(() {});
            },
            onTapDown: (event) {
              durationPeriod = 200.milliseconds;
              setState(() {});
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(myComboMenus.imageURL),
                ),
              ),
            )
                .animate(
                  onComplete: (controller) => controller.repeat(),
                )
                .scaleXY(begin: 0.8, end: 1.2, duration: durationPeriod)
                .scaleXY(begin: 1.2, end: 0.8, duration: durationPeriod),
          ),
          //Animate wala code haiii ---------------------------------------------------
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  myComboMenus.burgerName,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                // .animate(
                //     // onComplete: (controller) => controller.repeat(),
                //     )
                // .fade(begin: 0.3, delay: const Duration(milliseconds: 450)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  myComboMenus.burgerDesc,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${myComboMenus.burgerPrice.toInt()}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.white),
                          ),
                          TextSpan(
                            text:
                                ".${myComboMenus.burgerPrice.toStringAsFixed(2).split(".").last}\$",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    // Text(
                    //   '19.95\$',
                    //   style: Theme.of(context)
                    //       .textTheme
                    //       .bodyLarge
                    //       ?.copyWith(color: Colors.white),
                    // ),
                    //const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.amber,
                      ),
                      child: const Icon(
                        Icons.shopping_cart_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ).animate().flip(duration: 1.seconds);
    //.slideX(duration: const Duration(seconds: 1),);
  }

  //For arko method
  Widget hobbit(BurgerClass burgers) {
    const imageHeight = 100.0;
    const yPosition = -imageHeight * 0.3;
    return Container(
      clipBehavior: Clip.none,
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Color(0xFF413F45),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              const SizedBox(
                height: imageHeight + yPosition * 0.5,
              ),
              Text(
                burgers.burgerName,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                burgers.burgerDesc,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.grey, fontSize: 11),
              ),
              const SizedBox(
                height: 20,
              ),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${burgers.burgerPrice.toInt()}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.white),
                        ),
                        TextSpan(
                          text:
                              ".${burgers.burgerPrice.toStringAsFixed(2).split(".").last}\$",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  // Text(
                  //   burgers.burgerPrice.toString(),
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .bodyMedium
                  //       ?.copyWith(color: Colors.white),
                  // ),

                  //Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              )
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            top: yPosition,
            child: Container(
              height: imageHeight,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(burgers.imageURL),
                ),
              ),
            )
                .animate(
                  onComplete: (controller) => controller.repeat(),
                )
                .rotate(begin: 0.2, end: 1.8, duration: 20.seconds),
          ),
        ],
      ),
    );
  }
}
