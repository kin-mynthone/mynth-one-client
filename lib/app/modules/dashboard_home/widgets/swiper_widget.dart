part of '../views/dashboard_home_view.dart';

class _SwiperWidget extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  const _SwiperWidget({required this.itemCount, required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenWidth <= 428 && screenWidth > 390 ? 230 : 250,
      width: screenWidth * 0.95,
      child: Swiper(
          itemBuilder: itemBuilder,
          itemCount: itemCount,
          axisDirection: AxisDirection.right,
          itemWidth: screenWidth * 0.85,
          allowImplicitScrolling: true,
          containerWidth: screenWidth,
          layout: SwiperLayout.STACK),
    );
  }
}
