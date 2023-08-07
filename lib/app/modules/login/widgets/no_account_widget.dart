part of '../views/login_view.dart';

class _NoAccountWidget extends StatelessWidget {
  final Function onPressed;

  const _NoAccountWidget({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.80,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 5, right: 15),
                child: const Divider(
                  thickness: 1,
                  color: AppColors.h9F9F9F,
                  height: 50,
                ),
              ),
            ),
            TextButton(
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
                      color: AppColors.hF4F4F4,
                      fontSize: 15,
                    ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 15, right: 5),
                child: const Divider(
                  thickness: 1,
                  color: AppColors.h9F9F9F,
                  height: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
