part of '../views/home_view.dart';

class _HeaderWidget extends GetView<HomeController> {
  final String? profilePath;
  const _HeaderWidget({Key? key, required this.profilePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 45,
                height: 45,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Image.network(
                    profilePath!,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Text('Error loading image');
                    },
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    stringData: 'Hello 👋🏻 ',
                    fontSize: 15,
                    boldValue: FontWeight.normal,
                    color: controller.getSystemTheme(context)
                        ? AppColors.lightTextPrimary
                        : AppColors.darkTextPrimary, //TODO CHANGE COLOR,
                    centerAlignment: false,
                  ),
                  TextWidget(
                    stringData: 'Kindred',
                    fontSize: 22,
                    boldValue: FontWeight.w500,
                    color: controller.getSystemTheme(context)
                        ? AppColors.lightTextPrimary
                        : AppColors.darkTextPrimary, //TODO CHANGE COLOR,
                    centerAlignment: false,
                  ),
                ],
              ),
            ],
          ),
          ButtonIconWidget(
            onPressed: () => {},
            size: 50,
            buttonColor: controller.getSystemTheme(context)
                ? AppColors.primaryTranslucent
                : AppColors.primaryTranslucent,
            splashColor: controller.getSystemTheme(context)
                ? AppColors.lightPrimary.withOpacity(0.30)
                : AppColors.darkPrimary.withOpacity(0.30),
            highlightColor: controller.getSystemTheme(context)
                ? AppColors.lightPrimary.withOpacity(0.15)
                : AppColors.darkPrimary.withOpacity(0.15),
            iconPath: AssetPath.cNotification,
            iconColor: controller.getSystemTheme(context)
                ? AppColors.lightPrimary
                : AppColors.darkPrimary,
            borderRadius: 15,
          )
        ],
      ),
    );
  }
}
