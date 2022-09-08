import 'package:flutter/material.dart';
import 'package:flutter_reqres/app/utils/dialog_utils.dart';

import 'package:get/get.dart';

import '../../../core/models/models.dart';
import '../../../theme/theme.dart';
import '../../../ui/atoms/atoms.dart';
import '../controllers/users_controller.dart';

class FormUsersView extends GetView<UsersController> {
  FormUsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var usersState = Get.find<UsersController>();
    Employee? user = Get.arguments;
    if (user != null) {
      usersState.nameController.text = user.name;
    } else {
      usersState.nameController.text = '';
    }
    return Scaffold(
      backgroundColor: Constants.white,
      appBar: AppBar(
        backgroundColor: Constants.white,
        elevation: 1,
        title: Text(
          user == null ? 'Add Employee' : 'Edit Employee',
          style: fontStyle2.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Constants.primary,
            size: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: usersState.formUser,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: usersState.nameController,
                  decoration: formDecoration.copyWith(
                    label: Text(
                      'Name',
                      style: fontStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please input name employee";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: usersState.jobController,
                  decoration: formDecoration.copyWith(
                    label: Text(
                      'Job',
                      style: fontStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please input job employee";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GetBuilder<UsersController>(builder: (usersState) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
          child: ConfirmButton(
            isLoading: usersState.formLoading,
            onPressed: () async {
              if (!usersState.formUser.currentState!.validate()) {
                return;
              }
              dynamic id = user == null ? null : user.id;
              var res = await usersState.editUser(id);
              Get.back();
              if (res != null) {
                DialogUtils.instance.showEmployeDialog(
                  context,
                  title: id == null
                      ? 'Success Add Employee'
                      : 'Success Edit Employee',
                  employee: Employee.fromJson(res),
                );
              } else {
                DialogUtils.instance.showInfo(context,
                    title: id == null
                        ? 'Failed Add Employee'
                        : 'Failed Edit Employee',
                    message: '');
              }
            },
            label: 'SAVE',
          ),
        );
      }),
    );
  }
}
