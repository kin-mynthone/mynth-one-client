part of '../views/introduction_view.dart';

class _TextAndNavigationWidget extends GetView<IntroductionController> {
  const _TextAndNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Text(
          '${'exhibitor'.tr} ${'app'.tr}',
          maxLines: 1,
          overflow: TextOverflow.visible,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 35,
            fontFeatures: const [FontFeature.enable('smcp')],
          ),
        ),
        const SizedBox(height: 40),
        RoundedCornerButton(
          onPressed: () => {},
          text: 'get started'.tr,
          backgroundColor: const Color(0xFFFEFEFE),
          textColor: AppColors.h031223,
        ),
      ],
    );
  }
}
