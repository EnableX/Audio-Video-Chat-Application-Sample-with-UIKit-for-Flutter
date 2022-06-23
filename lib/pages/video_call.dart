
import 'dart:convert';

import 'package:enx_uikit_flutter/enx_uikit_flutter.dart';
import 'package:enx_uikit_flutter/utilities/enx_setting.dart';
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
    setting.createBottomOption(BottomOption.audio);
    setting.createBottomOption(BottomOption.video);
    setting.createBottomOption(BottomOption.groupChat);
    setting.createBottomOption(BottomOption.disconnect);
   setting.createBottomOption(BottomOption.cameraSwitch);

    setting.createTopOption(TopOption.userList);
    setting.createTopOption(TopOption.requestFloor);
    setting.createTopOption(TopOption.menu);

    return Scaffold(
      body: SafeArea(child: EnxVideoView(token: token, connectError: (Map<dynamic, dynamic> map) {
        print('connectError' + jsonEncode(map));
        Fluttertoast.showToast(
            msg: "connectError+${jsonEncode(map)}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,

            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Get.back();
      },
        disconnect: (Map<dynamic, dynamic> map) {
          Fluttertoast.showToast(
              msg: "disconnect+${jsonEncode(map)}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,

              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
          Get.back();
        },   ),),
    );
  }
  
}