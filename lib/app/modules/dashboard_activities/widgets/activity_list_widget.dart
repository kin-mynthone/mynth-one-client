part of '../views/dashboard_activities_view.dart';

class _ActivityListWidget extends GetView<DashboardActivitiesController> {
  final String status;
  const _ActivityListWidget({
    required this.status,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.only(bottom: 5),
      child: controller.activitiesData.length.isEqual(0)
          ? const EmptyData()
          : FadingListViewWidget(
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
