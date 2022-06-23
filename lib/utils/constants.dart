import 'dart:ui';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:sample_uikit/utils/size_config.dart';

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'Poppins-Regular',
);

final kGeneralTextStyle = TextStyle(color: kTextColor, fontFamily: 'Poppins-SemiBold', fontSize: 20.0);

const kPrimaryColor = Color(0xF59A0404);
const kPrimaryLightColor = Color(0xFFFEEFDD);

const kSecondaryColor = Color(0xFF979797);

const kTextColor = Color(0xFF085187);

const kCompleted_job_card_color = Color(0xFFCDF9C2);

const kHappy_client_card_color = Color(0xFFFC99A4);

const kProsals_card_color = Color(0xFF90CAF9);

const kJob_invitation_card_color = Color(0xFFD3D3FC);

final kLabelStyle = TextStyle(
  color: Color(0xff085187),
  fontWeight: FontWeight.bold,
  fontFamily: 'Poppins-Regular',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xff085187),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Color(0xff085187),
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  fontFamily: 'Poppins-Regular',
  color: Color(0xff085187),
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);


final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

const String urlBase =  'https://demo.enablex.io/';
/* To try the app with Enablex hosted service you need to set the kTry = true */
const bool kTry = true;
/*Use enablec portal to create your app and get these following credentials*/
 const String kAppId = "AppId";
const  String kAppkey = "AppKey";


const createRoom = 'createRoom';
const createToken = 'createToken';
var header = (kTry)
    ? {
  "x-app-id": kAppId,
  "x-app-key": kAppkey,
  "Content-Type": "application/json"
}
    : {"Content-Type": "application/json"};


Future<bool> checkInternetConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}