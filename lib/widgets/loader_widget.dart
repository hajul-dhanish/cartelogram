import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../theme/appTheme.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingIndicator(
      indicatorType: Indicator.ballScaleMultiple,
      colors: [AppTheme.of(context).primaryColor],
      strokeWidth: 1.5,
    );
  }
}
