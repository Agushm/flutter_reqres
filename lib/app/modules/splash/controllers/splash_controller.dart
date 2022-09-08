import 'package:flutter_reqres/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../core/models/models.dart';

class SplashController extends GetxController {
  void initState() async {
    await Future.delayed(Duration(seconds: 3));
    Get.offAllNamed(Routes.LOGIN, arguments: User.fromJson(mockUser));
  }

  @override
  void onInit() {
    initState();
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
}
