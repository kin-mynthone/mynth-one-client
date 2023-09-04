import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mynth_one_client/app/constants/app_strings.dart';
import 'package:mynth_one_client/app/helpers/asset_path_helper.dart';
import 'package:mynth_one_client/app/models/banks_model.dart';
import 'package:mynth_one_client/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

class BanksListTileWidget extends StatelessWidget {
  final Banks banksModel;
  final VoidCallback onTap;

  const BanksListTileWidget({
    super.key,
    required this.banksModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            banksModel.icon.toString(),
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return const Text('Error loading image');
            },
          ),
        ),
      ),
      title: Align(
        alignment: Alignment.centerLeft,
        child: TextWidget(
            stringData: banksModel.title.toString(),
            fontSize: screenWidth <= 428 && screenWidth > 390 ? 16 : 13,
            boldValue: FontWeight.w500,
            color: DashboardController.instance.getSystemTheme(context)
                ? AppColors.lightTextPrimary
                : AppColors.darkTextPrimary,
            centerAlignment: false),
      ),
      trailing: SizedBox(
        width: 25,
        height: 25,
        child: SvgPicture.asset(
          color: DashboardController.instance.getSystemTheme(context)
              ? AppColors.lightPrimary
              : AppColors.darkPrimary,
          AssetPath.cRightArrow,
        ),
      ),
    );
  }
}
