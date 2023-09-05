import 'package:flutter/material.dart';
import 'package:mynth_one_client/app/constants/app_numbers.dart';
import 'package:mynth_one_client/app/models/favorite_receiver_model.dart';
import 'package:mynth_one_client/app/modules/transfer_money/controllers/favorite_receiver_controller.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

class FavoriteListTileWidget extends StatelessWidget {
  final FavoriteReceiver favoriteReceiverModel;
  final VoidCallback onTap;

  const FavoriteListTileWidget({
    super.key,
    required this.favoriteReceiverModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: FavoriteReceiverController.instance.getSystemTheme(context)
            ? AppColors.lightBackgroundVariant
            : AppColors.darkBackgroundVariant,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppNumbers.cardBorderRadius),
        ),
        shadowColor: Colors.transparent,
        child: Container(
          width: screenWidth <= 428 && screenWidth > 390 ? 120 : 90,
          // ignore: prefer_const_constructors
          padding: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppNumbers.borderRadius),
                child: Image.network(
                  favoriteReceiverModel.icon.toString(),
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
              TextWidget(
                  overflow: false,
                  stringData: favoriteReceiverModel.receiver.toString(),
                  fontSize: screenWidth <= 428 && screenWidth > 390 ? 13 : 10,
                  boldValue: FontWeight.w500,
                  color: FavoriteReceiverController.instance
                          .getSystemTheme(context)
                      ? AppColors.lightTextPrimary
                      : AppColors.darkTextPrimary,
                  centerAlignment: false),
            ],
          ),
        ),
      ),
    );
  }
}
