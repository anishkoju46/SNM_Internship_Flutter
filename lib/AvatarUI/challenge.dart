import 'package:flutter/material.dart';

//Main ojb is to seperate Business logic and UI
class MyChallenge extends StatelessWidget {
  const MyChallenge(
      {super.key, this.onAdd, this.onMinus, required this.valueNotifier});
  final Function? onAdd;
  final Function? onMinus;
  final ValueNotifier valueNotifier;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          pills(
              addMinus: "Add",
              onPressed: () {
                valueNotifier.value++;
              }),
          pills(
              addMinus: "Minus",
              onPressed: () {
                valueNotifier.value--;
              }),
          ValueListenableBuilder(
              valueListenable: valueNotifier,
              builder: (context, count, child) {
                return Text("Count: $count");
              })
          //Text("Count: ${valueNotifier.value}")
        ],
      ),
    ));
  }

  Expanded pills({required String addMinus, required Function? onPressed}) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        color: Colors.amber,
        child: ElevatedButton(
          onPressed: () {
            if (onPressed != null) onPressed();
          },
          child: Text(addMinus),
        ),
      ),
    );
  }
}
