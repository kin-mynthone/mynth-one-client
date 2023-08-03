part of '../views/introduction_view.dart';

class _ButtonArrowWidget extends StatelessWidget {
  final Function onPressed;

  const _ButtonArrowWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        width: 85,
        height: 85,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [AppColors.hD9D3F9, AppColors.hE4F9F6],
              stops: [0.2, 1]),
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Center(
            child: FaIcon(
          FontAwesomeIcons.arrowRight,
          color: AppColors.h4A495E,
        )),
      ),
    );
  }
}
