import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynth_one_client/app/constants/app_numbers.dart';
import 'package:mynth_one_client/app/helpers/asset_path_helper.dart';
import 'package:mynth_one_client/app/models/activity_model.dart';
import 'package:mynth_one_client/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:mynth_one_client/app/modules/dashboard_home/controllers/snippet_activities_controller.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

class ActivityListTileWidget extends StatelessWidget {
  final Data activityModel;
  final VoidCallback onTap;

  const ActivityListTileWidget({
    super.key,
    required this.activityModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppNumbers.borderRadius),
            color: activityModel.typeOfActivity.toString() == 'received'
                ? AppColors.lightGreen
                : AppColors.lightRed),
        child: SizedBox(
          width: 20,
          height: 20,
          child: Center(
            child: SizedBox(
              child: SvgPicture.asset(
                activityModel.typeOfActivity.toString() == 'received'
                    ? AssetPath.cReceive
                    : AssetPath.cTransfer,
              ),
            ),
          ),
        ),
      ),
      title: Align(
        alignment: Alignment.centerLeft,
        child: TextWidget(
            stringData: activityModel.typeOfActivity.toString() == 'received'
                ? SnippetActivitiesController.instance
                    .getTitle(activityModel.receiver.toString(), true)
                : SnippetActivitiesController.instance
                    .getTitle(activityModel.sender.toString(), false),
            fontSize: screenWidth <= 428 && screenWidth > 390 ? 16 : 13,
            boldValue: FontWeight.w500,
            color: DashboardController.instance.getSystemTheme(context)
                ? AppColors.lightTextPrimary
                : AppColors.darkTextPrimary,
            centerAlignment: false),
      ),
      subtitle: Align(
        alignment: Alignment.centerLeft,
        child: TextWidget(
            stringData: SnippetActivitiesController.instance
                .getTime(activityModel.timeStamp!),
            fontSize: screenWidth <= 428 && screenWidth > 390 ? 16 : 13,
            boldValue: FontWeight.w300,
            color: DashboardController.instance.getSystemTheme(context)
                ? AppColors.lightTextSecondary
                : AppColors.darkTextSecondary,
            centerAlignment: false),
      ),
      trailing: RichText(
        text: TextSpan(
          text: activityModel.typeOfActivity.toString() == 'received'
              ? '+ '
              : '- ',
          style: GoogleFonts.poppins(
              color: activityModel.typeOfActivity.toString() == 'received'
                  ? AppColors.green
                  : AppColors.red,
              fontSize: screenWidth <= 428 && screenWidth > 390 ? 16 : 13,
              fontWeight: FontWeight.w600),
          children: <TextSpan>[
            TextSpan(
              text: activityModel.amount,
              style: GoogleFonts.poppins(
                  color: DashboardController.instance.getSystemTheme(context)
                      ? AppColors.lightTextPrimary
                      : AppColors.darkTextPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
