import 'package:crud_login/Neumorphic.dart';
import 'package:flutter/material.dart';

class ControllerPage extends StatefulWidget {
  const ControllerPage({super.key});

  @override
  State<ControllerPage> createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.cyan),
        title: const Text("JUST DO IT"),
      ),
      body: Center(
        child: Container(
          height: 250,
          width: 250,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),

          //Decoration Start
          decoration: BoxDecoration(
            image: const DecorationImage(
                fit: BoxFit.cover,
                opacity: 0.9,
                invertColors: false,
                image: NetworkImage(
                    "https://i.pinimg.com/564x/e1/63/3e/e1633e2d66bbe82d38fc32544ba1c271.jpg")),
            color: Colors.green,
            border: Border.all(
                color: Colors.cyan, width: 10.1, style: BorderStyle.solid),
            shape: BoxShape.circle,
            //Box shadow vaneko chai LIST rexa hai
            boxShadow: const [
              BoxShadow(
                  offset: Offset(10, -10),
                  color: Colors.cyan,
                  blurRadius: 10.1,
                  blurStyle: BlurStyle.normal)
            ],
            gradient: const LinearGradient(colors: Colors.accents),
          ),
          child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Neumorphic(),
                    ));
              },
              child: const Text("EXPLORE?")),
        ),
      ),
    ));
  }
}
