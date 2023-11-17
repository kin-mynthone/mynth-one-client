import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/constants/app_numbers.dart';
import 'package:mynth_one_client/app/constants/app_strings.dart';
import 'package:mynth_one_client/app/helpers/asset_path_helper.dart';
import 'package:mynth_one_client/app/models/activity_model.dart';
import 'package:mynth_one_client/app/modules/dashboard_home/controllers/snippet_activities_controller.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/activity_list_tile_widget.dart';
import 'package:mynth_one_client/app/widgets/button_icon_widget.dart';
import 'package:mynth_one_client/app/widgets/card_widget.dart';
import 'package:mynth_one_client/app/widgets/primary_button_widget.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

import '../controllers/dashboard_home_controller.dart';
part '../widgets/header_widget.dart';
part '../widgets/quick_options_widget.dart';
part '../widgets/activity_list_widget.dart';
part '../widgets/swiper_widget.dart';

class DashboardHomeView extends GetView<DashboardHomeController> {
  const DashboardHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          //? maybe we can use this later
          // Positioned(
          //   left: 230,
          //   top: -80,
          //   child: Container(
          //     width: 400,
          //     height: 400,
          //     decoration: BoxDecoration(
          //       gradient: RadialGradient(
          //         focalRadius: 10,
          //         colors: [
          //           const Color.fromARGB(133, 255, 183, 0),
          //           controller.getSystemTheme(context)
          //               ? const Color.fromARGB(0, 242, 244, 254)
          //               : const Color.fromARGB(0, 74, 73, 94),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // Positioned(
          //   left: -230,
          //   top: 220,
          //   child: Container(
          //     width: 400,
          //     height: 400,
          //     decoration: BoxDecoration(
          //       gradient: RadialGradient(
          //         focalRadius: 10,
          //         colors: [
          //           const Color.fromARGB(133, 93, 36, 214),
          //           controller.getSystemTheme(context)
          //               ? const Color.fromARGB(0, 242, 244, 254)
          //               : const Color.fromARGB(0, 74, 73, 94),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),

          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(AppNumbers.screenPadding),
                  child: _HeaderWidget(
                    profilePath: AppStrings.defaultImageUrl,
                  ),
                ),
                Obx(
                  () => _SwiperWidget(
                    itemCount: controller.cardData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CardWidget(
                        cardModel: controller.cardData[index],
                        onTap: () => {
                          controller.goToCardInfo(controller.cardData[index])
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),
                const _QuickOptionsWidget(),
                Obx(
                  () => _ActivityListWidget(
                    activitiesData:
                        SnippetActivitiesController.instance.activitiesData,
                    itemCount: SnippetActivitiesController
                        .instance.activitiesData.length,
                    ontapShowAll: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
