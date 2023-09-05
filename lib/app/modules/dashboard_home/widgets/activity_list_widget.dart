part of '../views/dashboard_home_view.dart';

class _ActivityListWidget extends GetView<DashboardHomeController> {
  final int itemCount;
  final VoidCallback? ontapShowAll;

  final List<Data> activitiesData;

  const _ActivityListWidget({
    Key? key,
    required this.itemCount,
    required this.ontapShowAll,
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
            color: controller.getSystemTheme(context)
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
                      overflow: false,
                      stringData: 'Activities',
                      fontSize:
                          screenWidth <= 428 && screenWidth > 390 ? 20 : 17,
                      boldValue: FontWeight.w700,
                      color: controller.getSystemTheme(context)
                          ? AppColors.lightTextPrimary
                          : AppColors.darkTextPrimary,
                      centerAlignment: false),
                  TextButton(
                    onPressed: () async {
                      ontapShowAll;
                      FocusScope.of(context).unfocus();
                    },
                    child: TextWidget(
                        overflow: false,
                        stringData: 'View All',
                        fontSize:
                            screenWidth <= 428 && screenWidth > 390 ? 13 : 12,
                        boldValue: FontWeight.w300,
                        color: controller.getSystemTheme(context)
                            ? AppColors.lightTextSecondary
                            : AppColors.darkTextSecondary,
                        centerAlignment: false),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: itemCount.isEqual(0)
                    ? Center(
                        child: _EmptyData(
                          color: controller.getSystemTheme(context)
                              ? AppColors.lightTextPrimary
                              : AppColors.darkTextPrimary,
                        ),
                      )
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
              onTap: () {},
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
          overflow: false,
          stringData: 'No Activity to show',
          fontSize: screenWidth <= 428 && screenWidth > 390 ? 15 : 12,
          boldValue: FontWeight.w800,
          color: color,
          centerAlignment: false,
        ),
        TextWidget(
          overflow: false,
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
