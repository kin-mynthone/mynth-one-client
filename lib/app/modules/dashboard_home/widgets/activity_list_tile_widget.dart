import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynth_one_client/app/helpers/asset_path_helper.dart';
import 'package:mynth_one_client/app/models/activity_model.dart';
import 'package:mynth_one_client/app/modules/dashboard_home/controllers/home_controller.dart';
import 'package:mynth_one_client/app/modules/dashboard_home/controllers/partial_activities_controller.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

class ActivityListTileWidget extends StatelessWidget {
  final Data activityCompleteModel;
  final VoidCallback tileOnTap;

  const ActivityListTileWidget({
    super.key,
    required this.activityCompleteModel,
    required this.tileOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: tileOnTap,
      leading: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: activityCompleteModel.typeOfActivity.toString() == 'received'
                ? AppColors.lightGreen
                : AppColors.lightRed),
        child: SizedBox(
          width: 20,
          height: 20,
          child: Center(
            child: SizedBox(
              child: SvgPicture.asset(
                activityCompleteModel.typeOfActivity.toString() == 'received'
                    ? AssetPath.cReceive
                    : AssetPath.cTransfer,
              ),
            ),
          ),
        ),
      ),
      title: TextWidget(
          stringData:
              activityCompleteModel.typeOfActivity.toString() == 'received'
                  ? PartialActivitiesController.instance
                      .getTitle(activityCompleteModel.receiver.toString(), true)
                  : PartialActivitiesController.instance
                      .getTitle(activityCompleteModel.sender.toString(), false),
          fontSize: 16,
          boldValue: FontWeight.w500,
          color: HomeController.instance.getSystemTheme(context)
              ? AppColors.lightTextPrimary
              : AppColors.darkTextPrimary,
          centerAlignment: false),
      subtitle: TextWidget(
          stringData: PartialActivitiesController.instance
              .getTime(activityCompleteModel.timeStamp!),
          fontSize: 13,
          boldValue: FontWeight.w300,
          color: HomeController.instance.getSystemTheme(context)
              ? AppColors.lightTextSecondary
              : AppColors.darkTextSecondary,
          centerAlignment: false),
      trailing: RichText(
        text: TextSpan(
          text: activityCompleteModel.typeOfActivity.toString() == 'received'
              ? '+ '
              : '- ',
          style: GoogleFonts.poppins(
              color:
                  activityCompleteModel.typeOfActivity.toString() == 'received'
                      ? AppColors.green
                      : AppColors.red,
              fontSize: 16,
              fontWeight: FontWeight.w600),
          children: <TextSpan>[
            TextSpan(
              text: activityCompleteModel.amount,
              style: GoogleFonts.poppins(
                  color: HomeController.instance.getSystemTheme(context)
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
