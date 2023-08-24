part of '../views/dashboard_cards_view.dart';

class _CardListWidget extends GetView<DashboardCardsController> {
  const _CardListWidget();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: controller.cardData.length.isEqual(0)
          ? _EmptyData(
              color: controller.getSystemTheme(context)
                  ? AppColors.lightTextPrimary
                  : AppColors.darkTextPrimary,
            )
          : _FadingListViewWidget(
              dataLength: controller.cardData.length,
              cardData: controller.cardData.toList(),
            ),
    );
  }
}

class _FadingListViewWidget extends StatelessWidget {
  final int dataLength;
  final List<Data> cardData;
  const _FadingListViewWidget(
      {required this.dataLength, required this.cardData});
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(214, 0, 0, 0),
            Colors.transparent,
            Colors.transparent,
            Color.fromARGB(214, 0, 0, 0),
          ],
          stops: [
            0.0,
            0.05,
            0.95,
            1.04
          ], // 10% purple, 80% transparent, 10% purple
        ).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 15.0, bottom: 0.0),
        scrollDirection: Axis.vertical,
        itemCount: dataLength,
        itemBuilder: (context, index) {
          return CardWidget(
            cardModel: cardData[index],
            onTap: () => {
              DashboardCardsController.instance.goToCardInfo(cardData[index])
            },
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
      ),
    );
  }
}

class _EmptyData extends StatelessWidget {
  final Color color;
  const _EmptyData({
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextWidget(
          stringData: 'No Cards to show',
          fontSize: 15,
          boldValue: FontWeight.w800,
          color: color,
          centerAlignment: false,
        ),
        TextWidget(
          stringData: 'You can add your first card here',
          fontSize: 10,
          boldValue: FontWeight.normal,
          color: color,
          centerAlignment: false,
        ),
      ],
    );
  }
}
