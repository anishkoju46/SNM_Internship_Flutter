import 'package:flutter/material.dart';

class MyStatelessSmoothIndicator extends StatelessWidget {
  MyStatelessSmoothIndicator({
    super.key,
    required this.pageController,
    required this.count,
    this.activeColor,
    this.inActiveColor,
  });
  final PageController pageController;
  final int count;
  final Color? activeColor;
  final Color? inActiveColor;

  late final ValueNotifier<int> currentIndex =
      ValueNotifier(pageController.initialPage);
  @override
  Widget build(BuildContext context) {
    pageController.addListener(() {
      final scrollIndex = pageController.page!.toInt();
      if (scrollIndex != currentIndex.value) {
        currentIndex.value = scrollIndex;
      }
    });
    return ValueListenableBuilder(
        valueListenable: currentIndex,
        builder: (context, updatedIndex, child) {
          //print(updatedIndex);
          return Wrap(
            children: List.generate(
              count,
              (index) => customPageIndicator(
                activeColor: activeColor,
                inActiveColor: inActiveColor,
                index: index,
              ),
            ),
          );
        });
  }

  InkWell customPageIndicator({
    double height = 7,
    double width = 17,
    Color? inActiveColor,
    Color? activeColor,
    required int index,
  }) =>
      InkWell(
        onTap: () {
          pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
          height: height,
          width: (index == currentIndex.value ? 1.4 : 1) * width,
          decoration: BoxDecoration(
            color: index == currentIndex.value
                ? activeColor ?? Colors.black
                : inActiveColor ?? Colors.grey,
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
      );
}
