import 'package:flutter/material.dart';

class FinanceUI extends StatefulWidget {
  const FinanceUI({super.key});

  @override
  State<FinanceUI> createState() => _FinanceUIState();
}

class _FinanceUIState extends State<FinanceUI> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff244F9D),
        //backgroundColor: Colors.black,
        body: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  part1(context),
                  Container(
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, bottom: 20),
                      color: const Color(0xff244F9D),
                      child: iconScroll()),
                  bodyMethod1(context)
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 5, left: 20, right: 20),
              color: const Color(0xffF7F8FC),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  footerIconMethod(
                      footerIcon: Icons.home,
                      iconCaption: "Home",
                      iconCaptionColor: const Color(0xff234C9D),
                      iconColor: const Color(0xff234C9D)),
                  footerIconMethod(
                      footerIcon: Icons.money, iconCaption: "History"),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xff234C9D)),
                    child: const Icon(Icons.add, color: Color(0xffFEFEFE)),
                  ),
                  footerIconMethod(
                      footerIcon: Icons.card_travel_sharp,
                      iconCaption: "Cards"),
                  footerIconMethod(
                      footerIcon: Icons.person, iconCaption: "Profile")
                ],
              ),
            ),
          ],
        ),
        //Buttom Navigation CODE
        // bottomNavigationBar: Container(
        //   color: const Color(0xffF7F8FC),
        //   height: 81,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       footerIconMethod(
        //           footerIcon: Icons.home,
        //           iconCaption: "Home",
        //           iconCaptionColor: const Color(0xff234C9D),
        //           iconColor: const Color(0xff234C9D)),
        //       footerIconMethod(footerIcon: Icons.money, iconCaption: "History"),
        //       Container(
        //         height: 40,
        //         width: 40,
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(15),
        //             color: const Color(0xff234C9D)),
        //         child: const Icon(Icons.add, color: Color(0xffFEFEFE)),
        //       ),
        //       footerIconMethod(
        //           footerIcon: Icons.card_travel_sharp, iconCaption: "Cards"),
        //       footerIconMethod(footerIcon: Icons.person, iconCaption: "Profile")
        //     ],
        //   ),
        // ),
      ),
    );
  }

  Container bodyMethod1(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 20),
      decoration: const BoxDecoration(
          color: Color(0xffF7F8FC),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Text("Recent Transactions",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color(0xff0D3E68),
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text("See all",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: const Color(0xff2D4B7F),
                              fontWeight: FontWeight.bold,
                            )),
                  ),
                )
              ],
            ),
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                    color: const Color(0xffFEFEFE),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xffD2D2D2),
                        blurRadius: 12,
                      )
                    ]),
                child: Row(
                  children: [
                    Text("All",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: const Color(0xff2D4B7F),
                              fontWeight: FontWeight.bold,
                            )),
                  ],
                ),
              ),
              // options(
              //     optionName: "All", optionNameColor: const Color(0xff2D4B7F)),
              Opacity(
                opacity: 0.4,
                child: options(
                    optionName: " Income",
                    optionNameColor: const Color(0xff2D4B7F),
                    optionIcon: Icons.arrow_downward_outlined,
                    optionIconColor: Colors.white,
                    iconContainerColor: Colors.green),
              ),
              Opacity(
                opacity: 0.4,
                child: options(
                    optionName: " Expense",
                    optionNameColor: const Color(0xff2D4B7F),
                    optionIcon: Icons.arrow_upward_outlined,
                    optionIconColor: Colors.white,
                    iconContainerColor: Colors.orange),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text("TODAY",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xffB8C1CB),
                    fontWeight: FontWeight.bold,
                    fontSize: 15)),
          ),
          Container(
            //padding: const EdgeInsets.symmetric(vertical: 20),
            child: groceryTransport(),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text("YESTERDAY",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xffB8C1CB),
                    fontWeight: FontWeight.bold,
                    fontSize: 15)),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
                color: const Color(0xffFEFEFE),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xffD2D2D2),
                    blurRadius: 12,
                  )
                ]),
            child: grocery(
                typeIcon: Icons.payment,
                expenseName: "Payment",
                expenseCaption: "Payment from Andre",
                price: "+\$650.00",
                date: "Aug 25",
                priceColor: Colors.green),
          ),
          //Footer code starts
        ],
      ),
    );
  }

  Container options(
      {IconData? optionIcon,
      Color? optionIconColor,
      required String optionName,
      required Color optionNameColor,
      required Color iconContainerColor}) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          color: const Color(0xffFEFEFE),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffD2D2D2),
              blurRadius: 12,
            )
          ]),
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: iconContainerColor),
            child: Icon(
              optionIcon,
              color: optionIconColor,
              size: 17,
            ),
          ),
          Text(optionName,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: optionNameColor,
                    fontWeight: FontWeight.bold,
                  )),
        ],
      ),
    );
  }

  Container footerIconMethod(
      {required IconData footerIcon,
      Color iconColor = const Color(0xffA2B8D6),
      required String iconCaption,
      Color iconCaptionColor = const Color(0xffA2B8D6)}) {
    return Container(
      color: const Color(0xffF5F8F7),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xffF5F8F7),
                boxShadow: const []),
            child: Icon(
              footerIcon,
              color: iconColor,
            ),
          ),
          Text(iconCaption,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: iconCaptionColor,
                    fontWeight: FontWeight.bold,
                  ))
        ],
      ),
    );
  }

  Column groceryTransport() {
    return Column(children: [
      Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: const BoxDecoration(
            color: Color(0xffFFFFFF),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Color(0xffD2D2D2),
                blurRadius: 2,
              )
            ]),
        child: grocery(
            typeIcon: Icons.food_bank,
            expenseName: "Grocery",
            expenseCaption: "Eataly downtown",
            price: "-\$50.68",
            date: "Aug 26",
            priceColor: const Color(0xff2D4B7F)),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: const BoxDecoration(
            color: Color(0xffFFFFFF),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Color(0xffD2D2D2),
                blurRadius: 2,
              )
            ]),
        child: grocery(
            typeIcon: Icons.emoji_transportation,
            expenseName: "Transport",
            expenseCaption: "UBER Pool",
            price: "-\$6.00",
            date: "Aug 26",
            priceColor: const Color(0xff2D4B7F)),
      )
    ]);
  }

  Row grocery(
      {required IconData typeIcon,
      required String expenseName,
      required String expenseCaption,
      required String price,
      required Color priceColor,
      required String date}) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xffEAF5FF),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xffD2D2D2),
                  blurRadius: 3,
                )
              ]),
          child: Icon(
            typeIcon,
            color: const Color(0xff4C5B85),
            size: 40,
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            //alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(expenseName,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color(0xff2D4B7F),
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                Text(expenseCaption,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color(0xff959EA5),
                          fontWeight: FontWeight.bold,
                        ))
              ],
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(price,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: priceColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            Text(date,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color(0xff959EA5),
                      fontWeight: FontWeight.bold,
                    ))
          ],
        )
      ],
    );
  }

  Container part1(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      decoration: const BoxDecoration(color: Color(0xff244F9D)),
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("\$2,589.50",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color(0xffF8FFFF),
                        fontWeight: FontWeight.bold,
                        fontSize: 30)),
                Text("Available Balance",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color(0xffA0B8EB),
                          fontWeight: FontWeight.bold,
                        ))
              ],
            ),
          ),
          Expanded(
              child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                alignment: Alignment.centerRight,
                child: Transform.rotate(
                  angle: 18 * 3.1415927 / 180,
                  child: const Icon(
                    Icons.notifications,
                    color: Color(0xffC1CBD3),
                    size: 30,
                  ),
                ),
              ),
              Positioned(
                left: 130,
                top: 5,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: const Color(0xff244F9D)),
                  child: Container(
                    alignment: Alignment.topRight,
                    height: 6,
                    width: 6,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xffF29589)),
                  ),
                ),
              ),
            ],
          )),
          Container(
            padding: const EdgeInsets.all(1.5),
            height: 50,
            width: 50,
            //color: Colors.red,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                //color: Colors.black,
                image: const DecorationImage(
                    image: AssetImage("assets/travelPic/travel2.jpeg"),
                    fit: BoxFit.cover),
              ),
            ),
          )
        ],
      ),
    );
  }

  Row iconScroll() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      aIcon(iconType: Icons.outbox, iconCaption: "Send"),
      aIcon(iconType: Icons.archive, iconCaption: "Request"),
      aIcon(iconType: Icons.attach_money, iconCaption: "Loan"),
      aIcon(iconType: Icons.add_card, iconCaption: "Topup"),
      //aIcon(iconType: Icons.emoji_people),
    ]);
  }

//Is is how u can make a method dymanic
  Column aIcon(
      {required IconData iconType,
      Color iconColor = const Color(0xff485D7A),
      required String iconCaption}) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xffF5F8F7),
              boxShadow: const [
                // BoxShadow(
                //   color: Color(0xffD2D2D2),
                //   blurRadius: 3,
                // )
              ]),
          child: Icon(
            iconType,
            color: iconColor,
            size: 40,
          ),
        ),
        Text(iconCaption,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: const Color(0xffA0B8EB),
                fontWeight: FontWeight.bold,
                fontSize: 16))
      ],
    );
  }
}
