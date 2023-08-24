import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/constants/app_numbers.dart';
import 'package:mynth_one_client/app/models/card_model.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/cards/card_widget.dart';
import 'package:mynth_one_client/app/widgets/primary_button_widget.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

import '../controllers/dashboard_cards_controller.dart';
part '../widgets/header_widget.dart';
part '../widgets/card_list_widget.dart';

class DashboardCardView extends GetView<DashboardCardsController> {
  const DashboardCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const _HeaderWidget(),
          Expanded(
            child: Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: const _CardListWidget()),
          ),
        ],
      ),
    );
  }
}
