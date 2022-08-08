import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Contants {
  //degismeyenler sinif ayrıldı
  Contants._(); //kurucu metodu gizlendi yeni nesne uretilmez
  static const String title = "Pokedex";

  static TextStyle getTitleTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: 60,
    );
  }

  static TextStyle getPokemonNameTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: 40,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle gettypechiptextStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: 10,
    );
  }

  static EdgeInsets getPadding() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return EdgeInsets.all(12.h);
    } else {
      return EdgeInsets.all(12.w);
    }
  }

  static _calculateFontSize(int size) {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return size
          .sp; //cıhazin ayarlardaki metin boyutuna gore textlerin sekillenmesi
    } else {
      return (size * 1.5).sp;
    }
  }
}
