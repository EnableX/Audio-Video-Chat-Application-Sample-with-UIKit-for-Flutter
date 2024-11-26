
import 'dart:convert';

import 'package:enx_uikit_flutter/enx_uikit_flutter.dart';
import 'package:enx_uikit_flutter/utilities/enx_setting.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
class VideoCall extends StatelessWidget{
  String token,userName;
  VideoCall(this.token, this.userName, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var setting = EnxSetting.instance;

    Set<EnxRequiredEventsOption> enxRequired= <EnxRequiredEventsOption>{};
    enxRequired.addAll([EnxRequiredEventsOption.audio,EnxRequiredEventsOption.video,EnxRequiredEventsOption.cameraSwitch,EnxRequiredEventsOption.audioSwitch,EnxRequiredEventsOption.annotation,EnxRequiredEventsOption.disconnect]);
    setting.configureRequiredEventList(enxRequired);
    setting.isPreScreening(true);

    return Scaffold(

      body: SafeArea(
        child: EnxVideoView(
          token: token,

          connectError: (Map<dynamic, dynamic> map) {
            if (kDebugMode) {
              print('connectError${jsonEncode(map)}');
            }
            Fluttertoast.showToast(
                msg: "connectError+${jsonEncode(map)}",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
            Get.back();
          },
          disconnect: (Map<dynamic, dynamic> map) {
            Fluttertoast.showToast(
                msg: "disconnect+${jsonEncode(map)}",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
            Get.back();
          }, onPageSlide: (EnxPageSlideEventName enxPageSlideEventName, bool isShow) {
          Fluttertoast.showToast(
              msg: "onPageSlide+${enxPageSlideEventName.name} $isShow",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }, onUserDataReceived: (Map<dynamic, dynamic> map) {

        }, embedUrl: '', connectToRoom: (Map<dynamic, dynamic> map) {

        },
        ),
      ),
    );
  }
  
}