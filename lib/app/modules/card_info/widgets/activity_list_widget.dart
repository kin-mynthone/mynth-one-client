part of '../views/card_info_view.dart';

class _ActivityListWidget extends StatelessWidget {
  final int itemCount;

  final List<Data> activitiesData;

  const _ActivityListWidget({
    Key? key,
    required this.itemCount,
    required this.activitiesData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppNumbers.cornerRadius),
                topRight: Radius.circular(AppNumbers.cornerRadius)),
            color: CardInfoController.instance.getSystemTheme(context)
                ? AppColors.lightBackgroundVariant
                : AppColors.darkBackgroundVariant),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 30, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextWidget(
                      stringData: 'Activities',
                      fontSize: 20,
                      boldValue: FontWeight.w700,
                      color: CardInfoController.instance.getSystemTheme(context)
                          ? AppColors.lightTextPrimary
                          : AppColors.darkTextPrimary,
                      centerAlignment: false),
                ],
              ),
            ),
            Container(
              height: 350,
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: itemCount.isEqual(0)
                  ? const Center(child: EmptyData())
                  : FadingListViewWidget(
                      dataLength: itemCount,
                      activities: activitiesData,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class FadingListViewWidget extends StatelessWidget {
  final int dataLength;
  final List<Data> activities;
  const FadingListViewWidget(
      {super.key, required this.dataLength, required this.activities});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShaderMask(
        shaderCallback: (Rect rect) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.purple,
              Colors.transparent,
              Colors.transparent,
              Colors.purple
            ],
            stops: [
              0.0,
              0.1,
              0.9,
              1.0
            ], // 10% purple, 80% transparent, 10% purple
          ).createShader(rect);
        },
        blendMode: BlendMode.dstOut,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: dataLength,
            itemBuilder: (context, index) {
              return ActivityListTileWidget(
                activityModel: activities[index],
                tileOnTap: () {},
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 5),
          ),
        ),
      ),
    );
  }
}

class EmptyData extends StatelessWidget {
  const EmptyData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextWidget(
          stringData: 'No Activity to show',
          fontSize: 15,
          boldValue: FontWeight.w800,
          color: AppColors.darkPrimary, //TODO CHANGE COLOR,
          centerAlignment: false,
        ),
        TextWidget(
          stringData: 'Start your first activity now',
          fontSize: 10,
          boldValue: FontWeight.normal,
          color: AppColors.darkPrimary, //TODO CHANGE COLOR,
          centerAlignment: false,
        ),
      ],
    );
  }
}
