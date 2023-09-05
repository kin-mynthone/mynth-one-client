part of '../views/personal_qr_code_view.dart';

class _BottomOptionsWidget extends GetView<PersonalQrCodeController> {
  const _BottomOptionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth,
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: AppNumbers.screenPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ButtonIconWidget(
              onPressed: () => {
                controller.screenshotController
                    .capture(delay: const Duration(milliseconds: 10))
                    .then((capturedImage) async {
                  await controller.screenshotController
                      .capture(delay: const Duration(milliseconds: 10))
                      .then((Uint8List? image) async {
                    showCapturedWidget(context, capturedImage!);

                    // if (image != null) {
                    //   final directory =
                    //       Directory('/storage/emulated/0/Download');
                    //   final imagePath =
                    //       await File('${directory.path}/mynthOneQr.png')
                    //           .create();
                    //   await imagePath.writeAsBytes(image);
                    // }
                  });
                }).catchError((onError) {
                  print(onError);
                })
              },
              size: 70,
              buttonColor: controller.getSystemTheme(context)
                  ? AppColors.primaryTranslucent
                  : AppColors.primaryTranslucent,
              splashColor: controller.getSystemTheme(context)
                  ? AppColors.lightPrimary.withOpacity(0.30)
                  : AppColors.darkPrimary.withOpacity(0.30),
              highlightColor: controller.getSystemTheme(context)
                  ? AppColors.lightPrimary.withOpacity(0.15)
                  : AppColors.darkPrimary.withOpacity(0.15),
              iconPath: AssetPath.cDownloadQr,
              iconColor: controller.getSystemTheme(context)
                  ? AppColors.lightPrimary
                  : AppColors.darkPrimary,
              borderRadius: AppNumbers.borderRadius,
            ),
            ButtonIconWidget(
              onPressed: () => {},
              size: 70,
              buttonColor: controller.getSystemTheme(context)
                  ? AppColors.primaryTranslucent
                  : AppColors.primaryTranslucent,
              splashColor: controller.getSystemTheme(context)
                  ? AppColors.lightPrimary.withOpacity(0.30)
                  : AppColors.darkPrimary.withOpacity(0.30),
              highlightColor: controller.getSystemTheme(context)
                  ? AppColors.lightPrimary.withOpacity(0.15)
                  : AppColors.darkPrimary.withOpacity(0.15),
              iconPath: AssetPath.cShare,
              iconColor: controller.getSystemTheme(context)
                  ? AppColors.lightPrimary
                  : AppColors.darkPrimary,
              borderRadius: AppNumbers.borderRadius,
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showCapturedWidget(
      BuildContext context, Uint8List capturedImage) {
    var screenWidth = MediaQuery.of(context).size.width;

    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppNumbers.screenPadding,
                      vertical: AppNumbers.screenPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GoBackButton(
                        iconColor: controller.getSystemTheme(context)
                            ? AppColors.lightPrimary
                            : AppColors.darkPrimary,
                        onPressed: () {
                          Get.back(closeOverlays: true);
                        },
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      TextWidget(
                        overflow: false,
                        stringData: 'Captured',
                        fontSize:
                            screenWidth <= 428 && screenWidth > 390 ? 20 : 17,
                        boldValue: FontWeight.w500,
                        color: controller.getSystemTheme(context)
                            ? AppColors.lightTextPrimary
                            : AppColors.darkTextPrimary,
                        centerAlignment: false,
                      ),
                    ],
                  )),
              Center(child: Image.memory(capturedImage)),
            ],
          ),
        ),
      ),
    );
  }
}
