import 'package:crud_login/goblin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MyBurger extends StatefulWidget {
  const MyBurger({super.key});

  @override
  State<MyBurger> createState() => _MyBurgerState();
}

class _MyBurgerState extends State<MyBurger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.amber,
      //appBar: AppBar(title: const Text("Burger")),

      //Main container//
      body: Container(
        //margin: const EdgeInsets.all(4),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Expanded(
              child: const Image(image: AssetImage("assets/images/ham.png"))
                  .animate(
                    onComplete: (controller) => controller.loop(),
                  )
                  .shimmer(
                    duration: 5.seconds,
                  )
                  .animate(
                    onComplete: (controller) => controller.loop(),
                  )
                  .scale(
                      duration: 2.seconds,
                      begin: const Offset(0.8, 0.8),
                      end: const Offset(1.2, 1.2))
                  .scale(
                    duration: 2.seconds,
                    begin: const Offset(1.2, 1.2),
                    end: const Offset(0.8, 0.8),
                  ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                    0.2,
                    1
                  ],
                      colors: [
                    Colors.black,
                    Color(0xFF2B2414),
                  ])),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                            text: "Get ready for the\n",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 33,
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(
                            text: 'best ',
                            style: TextStyle(
                              color: Colors.amber,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(
                            text: 'taste!!!',
                            style: TextStyle(
                              fontSize: 33,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                      ])),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "We offer 35 types of delicious burgers.\nYou will be really satisfied!",
                          style: TextStyle(
                            color: Color.fromARGB(255, 223, 215, 215),
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * .2),
                          child: MaterialButton(
                            color: Colors.amber,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MyGoblin(),
                                  ));
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Let's get started",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
