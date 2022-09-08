import 'package:flutter/material.dart';
import 'package:flutter_reqres/app/core/repository/repository.dart';
import 'package:get/get.dart';

import '../../../core/models/user.dart';

class UsersController extends GetxController {
  List<User> users = [];
  @override
  void onInit() {
    getUser();
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

  int page = 1;
  int maxPages = 2;
  bool usersLoading = false;

  Future getUser() async {
    usersLoading = true;
    update();
    if (page == 1) {
      users = [];
    }
    var res = await UserRepo.instance.getUsers();
    if (res != null && res['data'] != null) {
      var d = res['data'] as List;
      d.forEach((e) {
        users.add(User.fromJson(e));
      });
    } else {
      Get.snackbar('Failed Get Users', '');
    }
    usersLoading = false;
    update();
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool formLoading = false;
}
