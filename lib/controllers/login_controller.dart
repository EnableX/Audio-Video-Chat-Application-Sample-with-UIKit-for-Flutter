import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/video_call.dart';
import '../utils/constants.dart';
import '../utils/request.dart';

class LoginController extends GetxController {

   late TextEditingController roomIdTextController;
   late TextEditingController nameTextController;
   late String role;
  @override
  void onInit() {
    roomIdTextController = TextEditingController();
    nameTextController = TextEditingController();
    super.onInit();
  }

  void apiLogin() async {
    Get.dialog(const Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    Requests request = Requests(url: createRoom);
    request.post().then((value) {

      Get.back();
      final parsedJson = jsonDecode(value.body);
      if (kDebugMode) {
        print(parsedJson);
      }
if(parsedJson['result']==0) {
  roomIdTextController.text = parsedJson['room']['room_id'];
}else{
  Get.snackbar(
      "Failed", parsedJson['desc'],
      backgroundColor: Colors.white,
      colorText: const Color(0xFF1A1E78),
      snackPosition: SnackPosition.BOTTOM);

}


    }).catchError((onError) {});
  }
   void apiCreateToken(String roomId) async {
     Get.dialog(const Center(child: CircularProgressIndicator()),
         barrierDismissible: false);

     Requests request = Requests(url: createToken, body: jsonEncode({
       'name': nameTextController.text,
       'role':'participant',//paticipant or moderator
       'user_ref':'2236',
       'roomId':roomId
     }));
     request.post().then((value) {
       if (kDebugMode) {
         print(value.body);
       }
       final parsedJson = jsonDecode(value.body);
       if(parsedJson['result']==0){
       if (kDebugMode) {
         print(parsedJson['result']);
       }
       Get.off(() => VideoCall(parsedJson['token'].toString(),nameTextController.text.toString()));
}else{
         Get.back();
         Get.snackbar(
      "Failed", parsedJson['error'],
      backgroundColor: Colors.white,
      colorText: const Color(0xFF1A1E78),
      snackPosition: SnackPosition.BOTTOM);

}
     }).catchError((onError) {});
   }
  @override
  void onClose() {
    roomIdTextController.dispose();
    nameTextController.dispose();
    super.onClose();
  }
}
