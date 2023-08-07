part of '../views/home_view.dart';

class ActivityHeaderWithDateWidget
    extends GetView<PartialActivitiesController> {
  final bool showTime;
  final String headerTitle;
  final bool showButton;
  final Function onPressed;

  const ActivityHeaderWithDateWidget({
    super.key,
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
                color: AppColors.hF1F0FF,
                centerAlignment: false,
              ),
              Container(
                child: showTime
                    ? TextWidget(
                        stringData: 'Today, ${controller.getDate()}',
                        fontSize: 13,
                        boldValue: false,
                        color: AppColors.hF1F0FF,
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
                    color: AppColors.hF1F0FF,
                  ),
                )
              : null,
        ),
      ],
    );
  }
}
