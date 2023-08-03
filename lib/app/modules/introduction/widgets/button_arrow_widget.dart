part of '../views/introduction_view.dart';

class _ButtonArrowWidget extends StatelessWidget {
  final Function onPressed;

  const _ButtonArrowWidget({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    const borderRadius = 30.0;

    return Material(
      color: AppColors.hF1F0FF,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        splashColor: AppColors.hF4F4F4.withOpacity(0.30),
        highlightColor: AppColors.h031223.withOpacity(0.15),
        onTap: () => onPressed(),
        child: const SizedBox(
          width: 85,
          height: 85,
          child: Center(
              child: FaIcon(
            FontAwesomeIcons.arrowRight,
            color: AppColors.h4A495E,
          )),
        ),
      ),
    );
  }
}
