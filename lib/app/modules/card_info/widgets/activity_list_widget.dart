// ignore_for_file: public_member_api_docs, sort_constructors_first
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
    var screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: Container(
        width: screenWidth,
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
              padding: const EdgeInsets.only(top: 20, left: 30, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextWidget(
                      stringData: 'Activities',
                      fontSize:
                          screenWidth <= 428 && screenWidth > 390 ? 20 : 17,
                      boldValue: FontWeight.w700,
                      color: CardInfoController.instance.getSystemTheme(context)
                          ? AppColors.lightTextPrimary
                          : AppColors.darkTextPrimary,
                      centerAlignment: false),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 10,
                ),
                child: itemCount.isEqual(0)
                    ? Center(
                        child: _EmptyData(
                        color:
                            CardInfoController.instance.getSystemTheme(context)
                                ? AppColors.lightTextPrimary
                                : AppColors.darkTextPrimary,
                      ))
                    : _FadingListViewWidget(
                        dataLength: itemCount,
                        activities: activitiesData,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FadingListViewWidget extends StatelessWidget {
  final int dataLength;
  final List<Data> activities;
  const _FadingListViewWidget(
      {required this.dataLength, required this.activities});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShaderMask(
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
              0.1,
              0.9,
              1.0
            ], // 10% purple, 80% transparent, 10% purple
          ).createShader(rect);
        },
        blendMode: BlendMode.dstOut,
        child: ListView.separated(
          padding: const EdgeInsets.only(top: 10.0, bottom: 30.0),
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
    var screenWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextWidget(
          stringData: 'No Activity to show',
          fontSize: screenWidth <= 428 && screenWidth > 390 ? 15 : 12,
          boldValue: FontWeight.w800,
          color: color,
          centerAlignment: false,
        ),
        TextWidget(
          stringData: 'Start your first activity now',
          fontSize: screenWidth <= 428 && screenWidth > 390 ? 11 : 10,
          boldValue: FontWeight.normal,
          color: color,
          centerAlignment: false,
        ),
      ],
    );
  }
}
