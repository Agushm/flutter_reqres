import 'package:flutter/material.dart';
import 'package:flutter_reqres/app/ui/atoms/atoms.dart';

import 'package:get/get.dart';

import '../../../theme/theme.dart';
import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  LoginView({Key? key}) : super(key: key);

  final AuthController authState = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0),
      body: SingleChildScrollView(
        child: Form(
          key: authState.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Text('Login',
                    style: fontStyle2.copyWith(
                        fontSize: 35, fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: authState.emailController,
                  decoration: formDecoration.copyWith(
                    label: Text(
                      'Email',
                      style: fontStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  validator: (value) {
                    if (!value.toString().isEmail) {
                      return "Masukan email yang valid";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: authState.passwordController,
                  decoration: formDecoration.copyWith(
                    label: Text(
                      'Password',
                      style: fontStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty || value.trim().length < 3) {
                      return "Masukan password";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 60),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GetBuilder<AuthController>(builder: (context) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
          child: ConfirmButton(
            isLoading: context.isLoading,
            onPressed: () {
              if (!authState.formKey.currentState!.validate()) {
                return;
              }
              authState.login();
            },
            label: 'Login',
          ),
        );
      }),
    );
  }
}
