import 'package:flutter/material.dart';

import 'package:mynth_one_client/app/widgets/loading_indicator.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black.withOpacity(0.7),
      child: const Center(
        child: LoadingIndicator(color: Colors.white),
      ),
    );
  }
}
