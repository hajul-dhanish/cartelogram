import 'package:flutter/Material.dart';
import '../theme/appTheme.dart';
import '../widgets/button_widget.dart';

// --
double custHeight = 25;
double topBarHeight = 0.0;

// Caption text padding
EdgeInsetsDirectional captionPadding =
    const EdgeInsetsDirectional.fromSTEB(0, 10, 8, 0);

// Caption text style
TextStyle captionTextStyle(context) => AppTheme.of(context).subtitle1.override(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    );

Icon searchIcon = const Icon(
  Icons.search_rounded,
  // color: Colors.grey,
  size: 22,
);

FFButtonOptions custButton(context) => FFButtonOptions(
      width: double.infinity,
      height: 50,
      color: AppTheme.of(context).primaryColor,
      textStyle: AppTheme.of(context).bodyText1.override(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
      borderSide: const BorderSide(
        color: Colors.transparent,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(5),
    );
