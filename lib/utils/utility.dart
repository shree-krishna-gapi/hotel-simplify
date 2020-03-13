import 'package:flutter/material.dart';

class Palatte {
  static Color color1 = Colors.purple[700];
  static Color color2 = Colors.purple[600];
  static Color white1 = Colors.white70;
  static Color white2 = Colors.white60;
  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color black1 = Colors.black87;
  static Color black2 = Colors.black54;
  static Color black3 = Colors.black45;
  static Color black4 = Colors.black38;
  static Color yellow1 = Colors.amber;
  static Color yellow2 = Colors.amberAccent;
  static Color wtext = Colors.white;
  static Color btext = Colors.black;
  static Color stext = Colors.black54;
  static Color ptrnColor = Colors.purple[800];
  // search Container
  static const Color transparent = Color(0x00000000);
  static Color errorColor = Colors.red.shade400;
  static Color errorBg = Colors.deepOrange[100];
  static Color successBg = Colors.black;
  static Color am = Colors.deepOrange[100];
  static Color am1 = Colors.deepOrange[100];


}

const mainLogo = 'assets/svg/HotelSimplifyLogo.svg';
const danfeLogo = 'assets/svg/DanfeLogo.svg';
const reloadImage = 'assets/svg/Refresh.svg';
const profileImage = 'assets/svg/Profile.svg';
const notificationActive = 'assets/svg/NotificationActive.svg';
const tableGreen = 'assets/svg/TableGreen.svg';
const tableRed = 'assets/svg/TableRed.svg';

class Urls {
  static const BASE_API_URL = "http://192.168.1.52:9999/api"; // local
//  static const BASE_API_URL ="http://192.168.1.75/api"; // suva
//  static const BASE_API_URL ="http://192.168.1.166/api"; // saroj
//  static const BASE_API_URL ="http://192.168.1.97/api"; //banzu
}


ThemeData basicTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
        button: base.button.copyWith(
        color: Colors.white,
        fontSize: 20,
//        fontFamily: 'Pacifico',
        fontWeight: FontWeight.w500,
        ), // pin pattern,
        title: base.title.copyWith(
            fontFamily: 'Ubuntu',
            fontSize: 16.0,
            color: Colors.black87,
            fontWeight: FontWeight.w600
        ),
    );
  }
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      textTheme: _basicTextTheme(base.textTheme),
      iconTheme: IconThemeData(
        color: Palatte.color2,
        size: 20.0,
      ),
      buttonColor: Colors.white10,
//      tabBarTheme: base.tabBarTheme.copyWith(
//        labelColor: Palatte.color1,
//        unselectedLabelColor: Colors.grey,
//      )
  );
}