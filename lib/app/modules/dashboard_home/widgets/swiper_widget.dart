part of '../views/dashboard_home_view.dart';

class _SwiperWidget extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  const _SwiperWidget(
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
