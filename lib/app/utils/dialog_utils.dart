import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:flutter_reqres/app/core/models/models.dart';
import 'package:get/get.dart';

import '../theme/theme.dart';
import '../ui/atoms/atoms.dart';

class DialogUtils {
  static DialogUtils instance = DialogUtils();

  void showInfo(BuildContext context,
      {String? title,
      String? message,
      Function()? onPressed,
      String? btnText}) {
    showModal(
        context: context,
        configuration:
            FadeScaleTransitionConfiguration(barrierDismissible: false),
        builder: (context) {
          return InfoDialog(
            title: title,
            message: message,
            onPressed: onPressed,
            btnText: btnText,
          );
        });
  }

  void showEmployeDialog(BuildContext context,
      {String? title, Employee? employee}) {
    showModal(
        context: context,
        configuration:
            FadeScaleTransitionConfiguration(barrierDismissible: false),
        builder: (context) {
          return EmployeeDialog(
            title: title,
            employee: employee,
          );
        });
  }

  void showLoading(BuildContext context, String message) {
    showModal(
        context: context,
        configuration:
            FadeScaleTransitionConfiguration(barrierDismissible: false),
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 5),
                const CircularProgressIndicator(),
                const SizedBox(height: 5),
                Text(
                  message,
                  style: fontStyle.copyWith(
                    color: Colors.black87,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future<bool?> showConfirmDialog(
      BuildContext context, String title, String message,
      {String? btnCancel, String? btnOK}) {
    return showModal(
        context: context,
        configuration:
            FadeScaleTransitionConfiguration(barrierDismissible: false),
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              MaterialButton(
                child: Text(
                  btnCancel != null ? btnCancel : 'Tidak',
                  style: fontStyle2.copyWith(
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  Get.back(result: false);
                },
              ),
              MaterialButton(
                color: Constants.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(btnOK != null ? btnOK : 'Ya',
                    style: fontStyle2.copyWith(color: Colors.white)),
                onPressed: () {
                  Get.back(result: true);
                },
              ),
            ],
          );
        });
  }
}
