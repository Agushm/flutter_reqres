import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/theme.dart';
import '../../../ui/atoms/atoms.dart';
import '../controllers/users_controller.dart';

class FormUsersView extends GetView<UsersController> {
  FormUsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var usersState = Get.find<UsersController>();
    return Scaffold(
      backgroundColor: Constants.grey,
      appBar: AppBar(
        backgroundColor: Constants.white,
        elevation: 1,
        title: Text(
          'Contacts',
          style: fontStyle2.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: usersState.formKey,
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
                  controller: usersState.emailController,
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
                  controller: usersState.passwordController,
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
      floatingActionButton: GetBuilder<UsersController>(builder: (usersState) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
          child: ConfirmButton(
            isLoading: usersState.formLoading,
            onPressed: () {
              if (!usersState.formKey.currentState!.validate()) {
                return;
              }
              //usersState.login();
            },
            label: 'Login',
          ),
        );
      }),
    );
  }
}
