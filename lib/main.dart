import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/theme/theme.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "ReqRes.in",
      themeMode: ThemeMode.light,
      theme: ThemeData.light().copyWith(
          colorScheme: ColorScheme.light(
        primary: Constants.primary,
      )),
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
