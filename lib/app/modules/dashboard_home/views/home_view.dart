import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/constants/app_numbers.dart';
import 'package:mynth_one_client/app/constants/app_strings.dart';
import 'package:mynth_one_client/app/helpers/asset_path_helper.dart';
import 'package:mynth_one_client/app/models/activity_model.dart';
import 'package:mynth_one_client/app/modules/dashboard_home/controllers/partial_activities_controller.dart';
import 'package:mynth_one_client/app/modules/dashboard_home/widgets/activity_list_tile_widget.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/button_icon_widget.dart';
import 'package:mynth_one_client/app/widgets/cards/card_widget.dart';
import 'package:mynth_one_client/app/widgets/cards/swiper_widget.dart';
import 'package:mynth_one_client/app/widgets/primary_button_widget.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

import '../controllers/home_controller.dart';
part '../widgets/header_widget.dart';
part '../widgets/quick_options_widget.dart';

part '../widgets/activity_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
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
                () => SwiperWidget(
                  itemCount: controller.cardData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardWidget(cardModel: controller.cardData[index]);
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: _QuickOptionsWidget(),
              ),
              const _ActivityWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
