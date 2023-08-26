// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mynth_one_client/app/modules/card_info/controllers/card_info_controller.dart';

import 'front_card_widget.dart';
import 'back_card_widget.dart';

class CardFlipWidget extends GetView<CardInfoController> {
  const CardFlipWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      key: controller.cardKey,
      flipOnTouch: false,
      fill: Fill
          .fillBack, // Fill the back side of the card to make in the same size as the front.
      direction: FlipDirection.HORIZONTAL, // default
      side: CardSide.FRONT, // The side to initially display.
      front: const FrontCardWidget(),
      back: const BackCardWidget(),
    );
  }
}
