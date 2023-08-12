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
          color: AppColors.darkPrimary, //TODO CHANGE COLOR,
          centerAlignment: false,
        ),
      ],
    );
  }
}
