import 'package:flutter/cupertino.dart';

import 'Dimensions.dart';

    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
class AppDimension extends Dimensions {
  @override
  double get bigMargin => 20;

  @override
  bool get isPhone =>
    
     data.size.shortestSide < 600 ? true :false;
  

  

  @override
  double get defaultMargin => 16;

  @override
  double get mediumMargin => 12;

  @override
  double get smallMargin => 8;

  @override
  double get verySmallMargin => 4;

  @override
  double get highElevation => 16;

  @override
  double get mediumElevation => 8;

  @override
  double get lightElevation => 4;

  @override
  double get bigText => 22;

  @override
  double get defaultText => 18;

  @override
  double get mediumText => 16;

  @override
  double get smallText => 12;

  @override
  double get verySmallText => 8;

  @override
  double get listImageSize => 50;

  @override
  double get imageBorderRadius => 8;

  @override
  double get imageHeight => 450;

  // @override
  //   textCaptionPadding =>  const EdgeInsetsDirectional.fromSTEB(0, 10, 8, 0);

  // @override
  // Padding get textFieldPadding => const Padding(padding: EdgeInsets.all(10));
}
