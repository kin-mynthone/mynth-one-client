part of '../views/dashboard_activities_view.dart';

class _HeaderWidget extends GetView<DashboardActivitiesController> {
  const _HeaderWidget({required this.tabController, Key? key})
      : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 60, bottom: 30, left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
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
            fontSize: 20,
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
                contentPadding: const EdgeInsets.symmetric(horizontal: 50),
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
                    fontSize: 12),
                labelStyle: GoogleFonts.poppins(
                    color: controller.getSystemTheme(context)
                        ? AppColors.lightSecondaryVariant
                        : AppColors.darkSecondaryVariant,
                    fontWeight: FontWeight.w700,
                    fontSize: 12),
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
