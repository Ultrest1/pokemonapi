import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemonapi/contants/contants.dart';
import 'package:pokemonapi/pages/bubble.dart';
import 'package:pokemonapi/ui_helper/ui_helper.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UiHelper.getAppTitleWidgetHeight(),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: Contants.getPadding(),
              child: Text(
                Contants.title,
                style: Contants.getTitleTextStyle(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => bubble(),
                  ),
                );
              },
              child: Image.asset(
                'assets/geyik.png',
                width: ScreenUtil().orientation == Orientation.portrait
                    ? 0.2.sh
                    : 0.2.sw,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
