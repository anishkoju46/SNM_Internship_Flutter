import 'package:flutter/material.dart';
import 'package:crud_login/creditCard.dart';

class WidgetHaru extends StatefulWidget {
  const WidgetHaru({super.key});

  @override
  State<WidgetHaru> createState() => _WidgetHaruState();
}

// ({String name, String sirname}) apple = (name: "abc", sirname: "xyz");
// ({String name, String sirname}) person = (name: "abc", sirname: "xyz");
// ({String name, String sirname}) asdf = (name: "abc", sirname: "xyz");

class _WidgetHaruState extends State<WidgetHaru> {
  //Records
  // ({String name, String sirname}) printApple() {
  //   // apple.name = "Shyau";
  //   // apple.name;
  //   //updating a record
  //   apple = (name: "pple", sirname: apple.sirname);
  //   if (apple == person) {
  //     print("both of them are identical");
  //   }
  //   return apple;
  // }

  // (int a, String b) aFunction(int aa, String bb) {
  //   return (aa, bb);
  // }

  //LIST KO TYPE IS CLASS
  final List<CreditCard>? myList = [
    CreditCard(
        imageURL:
            "https://i.pinimg.com/564x/5a/91/1e/5a911e38ee64cea87d089b9c1dd2130f.jpg",
        cardType: "Wise",
        cardNumber: "888**** ****2206",
        balance: 9400.75,
        accountType: "Account balance",
        primaryColor: Colors.green),
    CreditCard(
        imageURL:
            "https://i.pinimg.com/564x/f4/22/30/f42230e621c19fea5815dde7a09ed83c.jpg",
        cardType: "PayPal",
        cardNumber: "paypal.me/latifulfajar",
        balance: 11250.0,
        accountType: "Account balance",
        primaryColor: Colors.blue),
    CreditCard(
        imageURL:
            "https://i.pinimg.com/564x/28/99/08/289908a6bb2d5f2ab846f0606e72e0fe.jpg",
        cardType: "Mastercard",
        cardNumber: "888**** ****2206",
        balance: 7020.50,
        accountType: "Account balance",
        primaryColor: Colors.yellow),
    CreditCard(
        imageURL:
            "https://i.pinimg.com/564x/0c/52/47/0c524749a597a2af0c977b8c43985b13.jpg",
        cardType: "Visa",
        cardNumber: "888**** ****2206",
        balance: 4500.00,
        accountType: "Account balance",
        primaryColor: Colors.purple),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //printApple();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("ROW & COLUMN"),
      ),
      //MAIN CONTAINER IT IS
      body: secondUI(),
    ));
  }

  Container secondUI() {
    return Container(
      //color: Colors.red,
      margin: const EdgeInsets.all(12),
      decoration: boxKoBorder(),
      //color: Colors.grey,
      padding: const EdgeInsets.symmetric(horizontal: 2),
      // height: double.infinity,
      // width: double.infinity,
      //---------COLUMN -------------------
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            //--------YO CHAI ACCOUNT KO LAGI
            //CONTAINER CHAI BORDER USE GARNA KO LAGI USE GAREKO
            Container(
              decoration: const BoxDecoration(
                //color: Colors.yellow,
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(255, 233, 233, 233), width: 1.5)),
              ),
              //color: Colors.black,
              padding: const EdgeInsets.all(10),
              //margin: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                //bad practice
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Account",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text("View all of your accounts")
                    ],
                  ),
                  Container(
                    //margin: EdgeInsets.only(top: 7),
                    //color: Colors.deepPurple,
                    padding: const EdgeInsets.all(6),
                    //margin: const EdgeInsets.all(10),
                    decoration: boxKoBorder(),
                    child: const Row(children: [
                      Icon(Icons.edit_note),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Manage Account",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      )
                    ]),
                  ),
                ],
              ),
            ),

            for (int i = 0; i < myList!.length; i++) cardItems(myList![i]),

            // Column(
            //   children: myList!
            //       .asMap()
            //       .entries
            //       .map((item) => cardItems(item.value))
            //       .toList(),
            // ),

            // Expanded(child: ListView(

            // ))
          ]),
    );
  }

  Container cardItems(CreditCard cards) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: const BoxDecoration(
        border: Border(
          //top: BorderSide(color: Colors.black, width: 0.5),
          bottom:
              BorderSide(color: Color.fromARGB(255, 233, 233, 233), width: 1.5),
        ),
      ),
      //margin: const EdgeInsets.only(top: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(cards.imageURL),
              ),
              border: Border.all(
                color: cards.primaryColor,
              ),
              boxShadow: const [
                BoxShadow(color: Color.fromARGB(255, 59, 94, 71))
              ],
            ),
          ),
          const SizedBox(
            width: 3,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cards.cardType,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(cards.cardNumber)
              ],
            ),
          ),
          Expanded(
            child: Container(
              //margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  //Text("\$" + "${cards.balance}"),

                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "\$${cards.balance.toInt()}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                ".${cards.balance.toStringAsFixed(2).split(".").last}",
                            style: TextStyle(
                                color: Colors.grey.shade500, fontSize: 10)),
                      ],
                    ),
                  ),
                  Text(
                    cards.accountType,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 163, 163, 162),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration boxKoBorder() {
    return BoxDecoration(
      //box ko color
      color: Colors.white,
      border: Border.all(
          color: const Color.fromARGB(255, 233, 233, 233), width: 2.0),
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
            blurRadius: 0.5,
            color: Color.fromARGB(255, 231, 231, 233),
            spreadRadius: 0.5)
      ],
    );
  }

  Container firstUI() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: Colors.grey,
      height: double.infinity,
      width: double.infinity,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            height: 200,
            width: 1000,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/yoyo.jpg"))),
          ),
          const SizedBox(
            height: 12,
          ),
          const Row(
            children: [
              Icon(Icons.person),
              SizedBox(
                width: 10,
              ),
              Text("Dipak Prasad")
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Parsing complex json data in flutter",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "This post is a continuation of parsing JSON data. If you possess the mystical knowlegde...",
            style: TextStyle(fontSize: 17),
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            children: [
              Text("5 min read"),
              SizedBox(width: 10),
              Text("."),
              SizedBox(width: 4),
              Text("Jun 11")
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          const Row(
            children: [
              Icon(Icons.handshake),
              Text("11"),
              SizedBox(width: 30),
              Icon(Icons.message),
              Text("1"),
              Spacer(),
              Icon(Icons.bookmark),
              SizedBox(width: 30),
              Icon(Icons.more)
            ],
          ),
        ],
      ),
    );
  }

  Container container3() {
    return Container(
      color: Colors.blue,
      height: 70,
      width: 70,
      //
    );
  }

  Container container2() {
    return Container(
      color: Colors.green,
      height: 70,
      width: 70,
    );
  }

  Container container1() {
    return Container(
      color: Colors.red,
      height: 70,
      width: 70,
    );
  }
}
