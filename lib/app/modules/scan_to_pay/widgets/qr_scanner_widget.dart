part of '../views/scan_to_pay_view.dart';

class _QrScannerWidget extends GetView<ScanToPayController> {
  const _QrScannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight,
      width: screenWidth,
      child: MobileScanner(
        fit: BoxFit.cover,
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          String? rawValue;
          // final Uint8List? image = capture.image;
          for (final barcode in barcodes) {
            rawValue = barcode.rawValue;
          }
          controller.setscannedQrValue(rawValue!);
        },
      ),
    );
  }
}
