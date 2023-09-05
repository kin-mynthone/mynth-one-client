part of '../views/transfer_money_view.dart';

class _BanksWidget extends GetView<TransferMoneyController> {
  const _BanksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    final defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppNumbers.inputBorderRadius),
      borderSide: BorderSide(
          color: controller.getSystemTheme(context)
              ? AppColors.darkBackgroundVariant
              : AppColors.darkBackgroundVariant,
          width: 0.3),
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: AppNumbers.screenPadding,
              right: AppNumbers.screenPadding,
              bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                overflow: false,
                stringData: 'Banks',
                fontSize: screenWidth <= 428 && screenWidth > 390 ? 15 : 12,
                boldValue: FontWeight.w500,
                color: controller.getSystemTheme(context)
                    ? AppColors.lightTextPrimary
                    : AppColors.darkTextPrimary,
                centerAlignment: false,
              ),
              const SizedBox(
                height: 20,
              ),
              FormBuilderTextField(
                name: 'searchBank',
                onChanged: (value) => {},
                autofocus: false,
                style: GoogleFonts.poppins(
                  color: controller.getSystemTheme(context)
                      ? AppColors.lightTextPrimary
                      : AppColors.darkTextPrimary,
                  fontSize: screenWidth <= 428 && screenWidth > 390 ? 15 : 12,
                ),
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: screenWidth <= 428 && screenWidth > 390 ? 15 : 12,
                    fontWeight: FontWeight.w400,
                    color: controller.getSystemTheme(context)
                        ? AppColors.lightTextHint
                        : AppColors.darkTextHint,
                  ),
                  prefixIcon: const Icon(LineIcons.search),
                  prefixIconColor: controller.getSystemTheme(context)
                      ? AppColors.lightTextHint
                      : AppColors.darkTextHint,
                  focusedBorder: defaultBorder,
                  enabledBorder: defaultBorder,
                  errorBorder: defaultBorder,
                  focusedErrorBorder: defaultBorder,
                  filled: true,
                  fillColor: controller.getSystemTheme(context)
                      ? AppColors.lightBackgroundVariant
                      : AppColors.darkBackgroundVariant,
                  errorStyle: GoogleFonts.poppins(
                      color: AppColors.red,
                      fontSize:
                          screenWidth <= 428 && screenWidth > 390 ? 13 : 10),
                ),
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.none,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.text,
              ),
            ],
          ),
        ),
        const Expanded(
          child: BankListWidget(),
        ),
      ],
    );
  }
}
