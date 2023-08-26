part of '../views/dashboard_activities_view.dart';

class _HeaderWidget extends GetView<DashboardActivitiesController> {
  const _HeaderWidget({required this.tabController, Key? key})
      : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.only(top: 60, bottom: 30, left: 20, right: 20),
      width: screenWidth,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(20, 0, 0, 0),
              blurRadius: AppNumbers.cornerHeaderRadius,
              spreadRadius: 1,
            ),
          ],
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(AppNumbers.cornerHeaderRadius),
              bottomRight: Radius.circular(AppNumbers.cornerHeaderRadius)),
          color: controller.getSystemTheme(context)
              ? AppColors.lightBackgroundVariant
              : AppColors.darkBackgroundVariant),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            stringData: 'Activities',
            fontSize: screenWidth <= 428 && screenWidth > 390 ? 20 : 17,
            boldValue: FontWeight.w500,
            color: controller.getSystemTheme(context)
                ? AppColors.lightTextPrimary
                : AppColors.darkTextPrimary,
            centerAlignment: false,
          ),
          const SizedBox(
            height: 20,
          ),
          DefaultTabController(
            length: 2,
            child: Center(
              child: ButtonsTabBar(
                controller: tabController,
                radius: AppNumbers.borderRadius,
                contentPadding: EdgeInsets.symmetric(
                    horizontal:
                        screenWidth <= 428 && screenWidth > 390 ? 50 : 40),
                unselectedBackgroundColor: controller.getSystemTheme(context)
                    ? AppColors.lightSecondary
                    : AppColors.darkBackgroundVariant,
                decoration: BoxDecoration(
                  color: controller.getSystemTheme(context)
                      ? AppColors.lightPrimary
                      : AppColors.darkPrimary,
                ),
                unselectedLabelStyle: GoogleFonts.poppins(
                    color: controller.getSystemTheme(context)
                        ? AppColors.lightTextHint
                        : AppColors.darkTextHint,
                    fontWeight: FontWeight.w700,
                    fontSize:
                        screenWidth <= 428 && screenWidth > 390 ? 12 : 11),
                labelStyle: GoogleFonts.poppins(
                    color: controller.getSystemTheme(context)
                        ? AppColors.lightSecondaryVariant
                        : AppColors.darkSecondaryVariant,
                    fontWeight: FontWeight.w700,
                    fontSize:
                        screenWidth <= 428 && screenWidth > 390 ? 12 : 11),
                height: 56,
                onTap: (index) => {},
                tabs: const [
                  Tab(
                    text: "Received",
                  ),
                  Tab(
                    text: "Transferred",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
