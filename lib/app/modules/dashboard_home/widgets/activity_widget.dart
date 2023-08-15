part of '../views/home_view.dart';

class _ActivityWidget extends GetView<PartialActivitiesController> {
  const _ActivityWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: HomeController.instance.getSystemTheme(context)
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
                    stringData: 'Transactions',
                    fontSize: 20,
                    boldValue: FontWeight.w700,
                    color: HomeController.instance.getSystemTheme(context)
                        ? AppColors.lightTextPrimary
                        : AppColors.darkTextPrimary,
                    centerAlignment: false),
                TextButton(
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                  },
                  child: TextWidget(
                      stringData: 'View All',
                      fontSize: 13,
                      boldValue: FontWeight.w300,
                      color: HomeController.instance.getSystemTheme(context)
                          ? AppColors.lightTextSecondary
                          : AppColors.darkTextSecondary,
                      centerAlignment: false),
                )
              ],
            ),
          ),
          Obx(
            () => Container(
              height: 300,
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: controller.activitiesData.length.isEqual(0)
                  ? const EmptyData()
                  : FadingListViewWidget(
                      dataLength: controller.activitiesData.length,
                      activities: controller.activitiesData,
                    ),
            ),
          )
        ],
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
                activityCompleteModel: activities[index],
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
