part of '../views/activities_view.dart';

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextWidget(
          stringData: 'Activities',
          fontSize: 20,
          boldValue: true,
          color: AppColors.hF1F0FF,
          centerAlignment: false,
        ),
      ],
    );
  }
}
