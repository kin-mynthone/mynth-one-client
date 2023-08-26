part of '../views/login_view.dart';

class _NoAccountWidget extends StatelessWidget {
  final Function onPressed;

  const _NoAccountWidget({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.80,
        child: TextButton(
          onPressed: () {
            FocusScope.of(context).unfocus();
            onPressed();
          },
          child: Text(
            'do not have an account'.tr,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray,
                  fontSize: screenWidth <= 428 && screenWidth > 390 ? 13 : 11,
                ),
          ),
        ),
      ),
    );
  }
}
