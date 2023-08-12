import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';

class DebitCardSwiperWidget extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  const DebitCardSwiperWidget(
      {super.key, required this.itemCount, required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: AppColors.darkPrimary,
      height: 245,
      width: size.width,
      child: Swiper(
          itemBuilder: itemBuilder,
          itemCount: itemCount,
          axisDirection: AxisDirection.right,
          itemWidth: size.width * 0.9,
          allowImplicitScrolling: true,
          containerWidth: size.width,
          layout: SwiperLayout.STACK),
    );
  }
}
