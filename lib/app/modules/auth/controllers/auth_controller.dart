import 'package:flutter/material.dart';
import 'package:flutter_reqres/app/core/repository/repository.dart';
import 'package:flutter_reqres/app/routes/app_pages.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    print('init');
    emailController.text = "eve.holt@reqres.in";
    passwordController.text = "cityslicka";
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  bool isLoading = false;
  Future login() async {
    isLoading = true;
    update();
    var res = await AuthRepo.instance
        .login(email: emailController.text, password: passwordController.text);

    isLoading = false;
    update();
    if (res != null && res['token'] != null) {
      Get.offAllNamed(Routes.USERS);
    } else {
      Get.snackbar('Login Failed', '${res['error']}');
    }
    return res;
  }
}