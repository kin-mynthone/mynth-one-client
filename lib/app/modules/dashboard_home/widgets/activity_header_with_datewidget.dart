part of '../views/home_view.dart';

class _ActivityHeaderWithDateWidget
    extends GetView<PartialActivitiesController> {
  final bool showTime;
  final String headerTitle;
  final bool showButton;
  final Function onPressed;

  const _ActivityHeaderWithDateWidget({
    required this.showTime,
    required this.headerTitle,
    required this.showButton,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                stringData: headerTitle,
                fontSize: 22,
                boldValue: true,
                color: AppColors.darkPrimary, //TODO CHANGE COLOR,
                centerAlignment: false,
              ),
              Container(
                child: showTime
                    ? TextWidget(
                        stringData: 'Today, ${controller.getDate()}',
                        fontSize: 13,
                        boldValue: false,
                        color: AppColors.darkPrimary, //TODO CHANGE COLOR,
                        centerAlignment: false,
                      )
                    : null,
              ),
            ],
          ),
        ),
        Container(
          child: showButton
              ? IconButton(
                  onPressed: () => onPressed(),
                  alignment: Alignment.center,
                  icon: const FaIcon(
                    FontAwesomeIcons.arrowRight,
                    color: AppColors.darkPrimary, //TODO CHANGE COLOR,
                  ),
                )
              : null,
        ),
      ],
    );
  }
}
