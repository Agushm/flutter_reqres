import 'package:flutter_reqres/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  void initState() async {
    print('init');
    Future.delayed(Duration(seconds: 3))
        .then((value) => Get.offAllNamed(Routes.LOGIN));
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
