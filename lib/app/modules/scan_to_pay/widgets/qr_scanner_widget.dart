part of '../views/scan_to_pay_view.dart';

class _QrScannerWidget extends StatelessWidget {
  const _QrScannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MobileScanner(
        // fit: BoxFit.contain,
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          // final Uint8List? image = capture.image;
          for (final barcode in barcodes) {
            debugPrint('Barcode found! ${barcode.rawValue}');
          }
        },
      ),
    );
  }
}

//  QrImageView(
//             data: 'This QR code has an embedded image as well',
//             version: QrVersions.auto,
//             size: 320,
//             gapless: false,
//             embeddedImageStyle: const QrEmbeddedImageStyle(
//               size: Size(80, 80),
//             ),
//           )
