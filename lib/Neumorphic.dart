import 'package:flutter/material.dart';

class Neumorphic extends StatefulWidget {
  const Neumorphic({super.key});

  @override
  State<Neumorphic> createState() => _NeumorphicState();
}

class _NeumorphicState extends State<Neumorphic> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Challenge"),
      ),
      backgroundColor: const Color.fromARGB(255, 172, 172, 172),
      body: Center(
        //PARENT
        child: Container(
          height: 70,
          width: 170,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.blue,
            //boxShadow: const [],
          ),
          //CHILD
          child: Container(
            alignment: Alignment.center,
            height: 70,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                topLeft: Radius.circular(50),
              ),

              //shape: BoxShape.circle,
              color: Colors.blue.shade200,
            ),
            child: const Text("Challenge"),
          ),
        ),
      ),

      // backgroundColor: Colors.grey[300],
      // body: Center(
      //   child: GestureDetector(
      //     onTap: () {
      //       setState(() {
      //         isClicked != isClicked;
      //       });
      //     },
      //     child: AnimatedContainer(
      //       height: 200,
      //       width: 200,
      //       duration: const Duration(milliseconds: 250),
      //       decoration: BoxDecoration(
      //           color: Colors.grey[300],
      //           shape: BoxShape.circle,
      //           // SINCE BOX SHADOW IS LIST
      //           boxShadow: isClicked
      //               ? [
      //                   const BoxShadow(
      //                     color: Color(0xFFBEBEBE),
      //                     offset: Offset(10, 10),
      //                     blurRadius: 30,
      //                     spreadRadius: 1,
      //                   ),
      //                   const BoxShadow(
      //                     color: Colors.white,
      //                     offset: Offset(-10, -10),
      //                     blurRadius: 30,
      //                     spreadRadius: 1,
      //                   )
      //                 ]
      //               : null),
      //       child: Image.asset("assets/spotify.png"),
      //     ),
      //   ),
      // ),
    );
  }
}
