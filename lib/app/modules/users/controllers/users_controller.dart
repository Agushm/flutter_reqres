import 'package:flutter/material.dart';
import 'package:flutter_reqres/app/core/repository/repository.dart';
import 'package:get/get.dart';

import '../../../core/models/models.dart';

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

  final formUser = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  bool formLoading = false;

  Future<dynamic> editUser(String? id) async {
    formLoading = true;
    update();

    var res = await UserRepo.instance.createUser(
        data: {'name': nameController.text, 'job': jobController.text});

    formLoading = false;
    update();
    return res;
  }
}
