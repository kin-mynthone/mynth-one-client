part of '../views/transfer_money_view.dart';

class _FirstPartWidget extends StatelessWidget {
  const _FirstPartWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FavoriteReceiverController.instance.favoriteReceiverData.length
                  .isEqual(0)
              ? Container()
              // ignore: prefer_const_constructors
              : Column(
                  children: const [
                    _FavoriteWidget(),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
          const Expanded(child: _BanksWidget())
        ],
      ),
    );
  }
}
