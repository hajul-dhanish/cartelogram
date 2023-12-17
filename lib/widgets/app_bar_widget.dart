import 'package:flutter/material.dart';

import '../theme/appTheme.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color bgColor;
  final String title;
  final bool isBack;
  final String subTitle;
  final bool showAction;
  const BaseAppBar({
    Key? key,
    this.isBack = true,
    required this.title,
    this.subTitle = "",
    this.bgColor = Colors.white,
    this.showAction = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Visibility(
          visible: showAction,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
        ),
      ],
      leading: Visibility(
        visible: isBack,
        child: IconButton(
          iconSize: 26,
          icon: const Icon(
            Icons.keyboard_backspace,
            color: Colors.black,
            // size: 26,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTheme.of(context).title1.override(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
          ),
          if (subTitle != "") const SizedBox(height: 2),
          Visibility(
            visible: subTitle != "",
            child: Text(
              subTitle,
              style: AppTheme.of(context).bodyText2.override(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromARGB(255, 68, 68, 68),
                  ),
            ),
          ),
        ],
      ),
      // toolbarHeight: 50,
      // excludeHeaderSemantics: true,
      // scrolledUnderElevation: 5,
      // primary: false,
      centerTitle: false,
      leadingWidth: isBack ? 56 : 0,
      backgroundColor: bgColor,
      elevation: 0.0,
      // systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
