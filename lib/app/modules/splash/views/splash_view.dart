import 'package:flutter/material.dart';
import 'package:flutter_reqres/app/theme/theme.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Center(
        child: Text(
          'ReqRes',
          style: fontStyle2.copyWith(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
