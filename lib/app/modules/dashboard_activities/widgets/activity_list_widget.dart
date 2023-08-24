part of '../views/dashboard_activities_view.dart';

class _ActivityListWidget extends GetView<DashboardActivitiesController> {
  final String status;
  const _ActivityListWidget({
    required this.status,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: controller.activitiesData.length.isEqual(0)
          ? _EmptyData(
              color: controller.getSystemTheme(context)
                  ? AppColors.lightTextPrimary
                  : AppColors.darkTextPrimary,
            )
          : _FadingListViewWidget(
              dataLength: controller.activitiesData
                  .where((element) => element.typeOfActivity == status)
                  .length,
              activities: controller.activitiesData
                  .where((element) => element.typeOfActivity == status)
                  .toList(),
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
            0.1,
            0.9,
            1.0
          ], // 10% purple, 80% transparent, 10% purple
        ).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 15.0, bottom: 0.0),
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
          stringData: 'No Activity to show',
          fontSize: 23,
          boldValue: FontWeight.w800,
          color: color,
          centerAlignment: false,
        ),
        TextWidget(
          stringData: 'Start your first activity now',
          fontSize: 13,
          boldValue: FontWeight.normal,
          color: color,
          centerAlignment: false,
        ),
      ],
    );
  }
}
