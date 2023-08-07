import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/constants/app_numbers.dart';
import 'package:mynth_one_client/app/constants/app_strings.dart';
import 'package:mynth_one_client/app/modules/dashboard_home/controllers/partial_activities_controller.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/debit_cards/debit_card_widget.dart';
import 'package:mynth_one_client/app/widgets/debit_cards/debit_card_swiper_widget.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

import '../controllers/home_controller.dart';
import '../widgets/activity_list_widget.dart';

part '../widgets/header_widget.dart';
part '../widgets/activity_header_with_datewidget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
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
                () => DebitCardSwiperWidget(
                  itemCount: controller.cardData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return DebitCardWidget(
                        cardModel: controller.cardData[index]);
                  },
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ActivityHeaderWithDateWidget(
                      showButton: true,
                      onPressed: () => null,
                      headerTitle: 'Activity',
                      showTime: true,
                    ),
                    const SizedBox(height: 5),
                    const ActivityListWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
