part of '../views/dashboard_cards_view.dart';

class _HeaderWidget extends GetView<DashboardCardsController> {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 60, bottom: 30, left: 30, right: 30),
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
            stringData: 'Cards',
            fontSize: 20,
            boldValue: FontWeight.w500,
            color: controller.getSystemTheme(context)
                ? AppColors.lightTextPrimary
                : AppColors.darkTextPrimary,
            centerAlignment: false,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(AppNumbers.borderRadius)),
                      color: controller.getSystemTheme(context)
                          ? AppColors.lightBackground
                          : AppColors.darkBackground),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWidget(
                        stringData: '4',
                        fontSize: 25,
                        boldValue: FontWeight.w600,
                        color: controller.getSystemTheme(context)
                            ? AppColors.lightTextPrimary
                            : AppColors.darkTextPrimary,
                        centerAlignment: false,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextWidget(
                            stringData: 'Total',
                            fontSize: 12,
                            boldValue: FontWeight.w400,
                            color: controller.getSystemTheme(context)
                                ? AppColors.lightTextPrimary
                                : AppColors.darkTextPrimary,
                            centerAlignment: false,
                          ),
                          TextWidget(
                            stringData: 'Cards',
                            fontSize: 12,
                            boldValue: FontWeight.w400,
                            color: controller.getSystemTheme(context)
                                ? AppColors.lightTextPrimary
                                : AppColors.darkTextPrimary,
                            centerAlignment: false,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              PrimaryButtonWidget(
                buttonText: '+ New Card',
                height: 60,
                fontSize: 15,
                boldValue: FontWeight.w600,
                fontColor: controller.getSystemTheme(context)
                    ? AppColors.lightSecondary
                    : AppColors.darkSecondary,
                buttonColor: controller.getSystemTheme(context)
                    ? AppColors.lightPrimary
                    : AppColors.darkPrimary,
                splashColor: controller.getSystemTheme(context)
                    ? AppColors.lightSecondary.withOpacity(0.30)
                    : AppColors.darkSecondary.withOpacity(0.30),
                highlightColor: controller.getSystemTheme(context)
                    ? AppColors.lightSecondary.withOpacity(0.15)
                    : AppColors.darkSecondary.withOpacity(0.15),
                onTap: () => {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
