// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

class TextFormWidget extends StatelessWidget {
  final String name;
  final String hintText;
  final bool isRequired;
  final Color borderColor;
  final Color nameColor;
  final Color textColor;
  final Color hintColor;
  final Color fillColor;
  final TextInputType keyboardType;

  final void Function(String?)? onChanged;

  const TextFormWidget({
    Key? key,
    required this.name,
    required this.hintText,
    required this.isRequired,
    required this.borderColor,
    required this.nameColor,
    required this.textColor,
    required this.hintColor,
    required this.fillColor,
    required this.keyboardType,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: borderColor, width: 0.3),
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          stringData: name,
          fontSize: 15,
          boldValue: FontWeight.normal,
          color: nameColor,
          centerAlignment: false,
        ),
        const SizedBox(
          height: 10,
        ),
        FormBuilderTextField(
          name: name,
          onChanged: onChanged,
          autofocus: false,
          style: TextStyle(
            color: textColor,
          ),
          validator: (String? value) {
            if (isRequired) {
              if (value == null || value.trim().isEmpty) {
                return ' is required'.tr;
              }
            }

            return null;
          },
          autocorrect: false,
          decoration: InputDecoration(
            hintText: hintText.tr,
            hintStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: hintColor,
              ),
            ),
            focusedBorder: defaultBorder,
            enabledBorder: defaultBorder,
            errorBorder: defaultBorder,
            focusedErrorBorder: defaultBorder,
            filled: true,
            fillColor: fillColor,
            errorStyle: const TextStyle(color: AppColors.red, fontSize: 13),
          ),
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.none,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }
}
