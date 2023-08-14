import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class SwiperWidget extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  const SwiperWidget(
      {super.key, required this.itemCount, required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: 230,
      width: size.width * 0.95,
      child: Swiper(
          itemBuilder: itemBuilder,
          itemCount: itemCount,
          axisDirection: AxisDirection.right,
          itemWidth: size.width * 0.85,
          allowImplicitScrolling: true,
          containerWidth: size.width,
          layout: SwiperLayout.STACK),
    );
  }
}
