
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/default_button.dart';
import '../controllers/login_controller.dart';
import '../utils/utils.dart';

class LoginScreen extends StatelessWidget{
  static String routeName = "/login_screen";

  final LoginController _loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Enablex Login',
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment. center,
            children: <Widget>[
              TextFormField(
                controller: _loginController.nameTextController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,

                  hintText: 'Enter Name',

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                  ),
                ),

                validator: (value) =>
                value!.trim().isEmpty ? 'Name required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _loginController.roomIdTextController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,
                  hintText: 'Enter roomId',

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                  ),
                ),

                ),
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DefaultButton(
                  text: 'Create Room',
                  press: () async {
                      if (_formKey.currentState!.validate()) {
                        _loginController.apiLogin();
                    } else {
                      Get.snackbar(
                          "Failed", "Enter Name",
                          backgroundColor: Colors.white,
                          colorText: Color(0xFF1A1E78),
                          snackPosition: SnackPosition.BOTTOM);
                    }

                  }, ),
                  DefaultButton(
                    text: 'Join',
                    press: () async {

                      bool isPermissionGranted =
                      await handlePermissionsForCall(context);
                      if (isPermissionGranted) {

                        if (_formKey.currentState!.validate()) {

                          _loginController.apiCreateToken(_loginController.roomIdTextController.text.toString());
                        }

                      } else {
                        Get.snackbar(
                            "Failed", "Microphone Permission Required for Video Call.",
                            backgroundColor: Colors.white,
                            colorText: Color(0xFF1A1E78),
                            snackPosition: SnackPosition.BOTTOM);
                      }

                    }, )],
              )
            ],
          ),
        ),
      ),
    );
  }
}