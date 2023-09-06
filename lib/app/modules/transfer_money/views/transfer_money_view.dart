import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mynth_one_client/app/constants/app_numbers.dart';
import 'package:mynth_one_client/app/helpers/asset_path_helper.dart';
import 'package:mynth_one_client/app/modules/transfer_money/controllers/favorite_receiver_controller.dart';
import 'package:mynth_one_client/app/modules/transfer_money/controllers/local_auth_controller.dart';
import 'package:mynth_one_client/app/modules/transfer_money/widgets/bank_list_widget.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/alert_dialog_widget.dart';
import 'package:mynth_one_client/app/widgets/go_back_button_widget.dart';
import 'package:mynth_one_client/app/widgets/loading_overlay_widget.dart';
import 'package:mynth_one_client/app/widgets/primary_button_widget.dart';
import 'package:mynth_one_client/app/widgets/text_form_widget.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../controllers/transfer_money_controller.dart';
import '../widgets/card_list_modal_widget.dart';
import '../widgets/favorite_list_widget.dart';
part '../widgets/header_widget.dart';
part '../widgets/favorite_widget.dart';
part '../widgets/banks_widget.dart';
part '../widgets/first_part_widget.dart';
part '../widgets/second_part_widget.dart';
part '../widgets/third_part_widget.dart';
part '../widgets/forth_part_widget.dart';
part '../widgets/fifth_part_widget.dart';

class TransferMoneyView extends GetView<TransferMoneyController> {
  const TransferMoneyView({Key? key}) : super(key: key);

  static const _views = <Widget>[
    _FirstPartWidget(),
    _SecondPartWidget(),
    _ThirdPartWidget(),
    _ForthPartWidget(),
    _FifthPartWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          right: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppNumbers.screenPadding,
                    vertical: AppNumbers.screenPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _HeaderWidget(),
                  ],
                ),
              ),
              Expanded(child: _views[controller.currentIndex])
            ],
          ),
        ),
      ),
    );
  }
}
