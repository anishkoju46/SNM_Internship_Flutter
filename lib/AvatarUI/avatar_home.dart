import 'package:crud_login/AvatarUI/avatar.dart';
import 'package:crud_login/AvatarUI/challenge.dart';
import 'package:flutter/material.dart';

class MyAvatarHome extends StatefulWidget {
  const MyAvatarHome({super.key, this.challengeNotification});
  final int? challengeNotification;
  @override
  State<MyAvatarHome> createState() => _MyAvatarHomeState();
}

class _MyAvatarHomeState extends State<MyAvatarHome> {
  final List<
      ({
        String iconText,
        IconData icons,
        ValueNotifier notificationNotifier
      })> recordBottom = [
    (
      iconText: "Hero",
      icons: Icons.flash_on,
      notificationNotifier: ValueNotifier(0)
    ),
    (
      iconText: "Targets",
      icons: Icons.track_changes,
      notificationNotifier: ValueNotifier(0)
    ),
    (
      iconText: "Challenge",
      icons: Icons.emoji_events,
      notificationNotifier: ValueNotifier(0)
    ),
    (
      iconText: "Calendar",
      icons: Icons.calendar_month,
      notificationNotifier: ValueNotifier(0)
    ),
    (
      iconText: "Info",
      icons: Icons.content_paste_search_sharp,
      notificationNotifier: ValueNotifier(0)
    )
  ];
  int currentPage = 0;

  get index => null;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xff834900),
          body: Column(
            children: [
              Expanded(
                  child: IndexedStack(
                //Index stack vitra vako children ko state sab reserved hunxa!!
                index: currentPage,
                children: [
                  const Avatar(),
                  const Avatar(
                    headerBackgroundColor: Color(0xff664532),
                    iconBackgroundColor: Color(0xffF1DFD0),
                    indicatorColor: Color(0xffDE9F66),
                    levelColor: Color.fromARGB(255, 27, 16, 4),
                    //scaffoldBackgroundColor: Colors.grey,
                  ),
                  MyChallenge(
                      valueNotifier:
                          recordBottom[currentPage].notificationNotifier),
                  MyChallenge(
                      valueNotifier:
                          recordBottom[currentPage].notificationNotifier),
                  MyChallenge(
                      valueNotifier:
                          recordBottom[currentPage].notificationNotifier),
                ],
              )),
              bottomIconMethod(),
            ],
          )),
    );
  }

  Container bottomIconMethod() {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: recordBottom
            .asMap()
            .entries
            .map(
              (e) => bottomRow(context,
                  index: e.key,
                  iconText: e.value.iconText,
                  icons: e.value.icons,
                  challengeNotification: e.value.notificationNotifier),
            )
            .toList(),
      ),
    );
  }

  InkWell bottomRow(
    BuildContext context, {
    required String iconText,
    required IconData icons,
    required int index,
    required ValueNotifier challengeNotification,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          currentPage = index;
        });
      },
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
              color: index == currentPage
                  ? const Color(0xffFAF3E6)
                  : const Color(0xffBC7317)),
          child: Stack(
            children: [
              Icon(
                icons,
                size: 70,
                color: const Color(0xff6B3B00),
              ),
              //Only if the index is 2 i.e. challenge wala container ma matra yo component banau
              if (index >= 2) ...[
                Positioned(
                  right: 2,
                  top: 2,
                  child: Container(
                    alignment: Alignment.center,
                    height: 20,
                    width: 20,
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.amber),
                    child: ValueListenableBuilder(
                      valueListenable: challengeNotification,
                      builder: (context, count, child) {
                        return Text(
                          count <= 9 ? "$count " : "9+",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(),
                          textAlign: TextAlign.center,
                        );
                      },
                    ),
                  ),
                ),
                //const Text("IF")
              ]
            ],
          ),
        ),
        Text(
          iconText,
          style: const TextStyle(color: Colors.amber),
        )
      ]),
    );
  }
}
