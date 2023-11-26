import 'package:crud_login/burgerhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MyGoblin extends StatefulWidget {
  const MyGoblin({super.key});

  @override
  State<MyGoblin> createState() => _MyGoblinState();
}

class _MyGoblinState extends State<MyGoblin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF202124),
        //Main container//
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/burger.jpeg"),
                      fit: BoxFit.cover),
                  //color: Colors.red,
                ),
                // child: const Image(
                //   image: AssetImage("assets/images/burger.jpeg"),
                //   fit: BoxFit.contain,
                // ),
              ).animate().move(duration: 2.seconds),
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            Expanded(
              flex: 4,
              child: Container(
                //color: Colors.cyan,
                margin: const EdgeInsets.symmetric(vertical: 10),
                //color: Colors.orange,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("3× Goblin",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 38,
                                color: Colors.white)),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                            "Beef 600gr,cheese\ncheddar 3,onion,pickled\ncucumber,secialsauce\nburger bun",
                            style: TextStyle(fontSize: 33, color: Colors.grey)),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              "24.95\$",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            //Size box xa yeta
                            //const SizedBox(width: 100),
                            MaterialButton(
                              color: Colors.amber,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const MyBurgerHome(),
                                    ));
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 8),
                                child: Text(
                                  "Add to cart",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
