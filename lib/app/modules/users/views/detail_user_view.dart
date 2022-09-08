import 'package:flutter/material.dart';
import 'package:flutter_reqres/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/models/models.dart';
import '../../../theme/theme.dart';
import '../controllers/users_controller.dart';

class DetailUserView extends GetView<UsersController> {
  DetailUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? data = Get.arguments ?? User.fromJson(mockUser);
    return Scaffold(
      backgroundColor: Constants.grey,
      appBar: AppBar(
        backgroundColor: Constants.primary,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Constants.white,
            size: 25,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.FORM_USER,
                  arguments: Employee(
                      name: '${data!.firstName} ${data.lastName}',
                      job: '',
                      id: data.id.toString(),
                      createdAt: '',
                      updatedAt: ''));
            },
            icon: Icon(
              Icons.edit,
              color: Constants.white,
              size: 25,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: deviceHeight(context) / 2 - 60,
            decoration: BoxDecoration(color: Constants.primary),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 8, color: Constants.white),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(data!.avatar),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  '${data.firstName} ${data.lastName}',
                  style: fontStyle2.copyWith(
                      color: Constants.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Constants.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () => _launchUrl("tel:911"),
                      child: Row(
                        children: [
                          Icon(
                            Icons.phone,
                            size: 30,
                            color: Constants.primary,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '911',
                                style: fontStyle2.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Phone',
                                style: fontStyle.copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Constants.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () => _launchUrl(
                          "mailto:${data.email}?subject=Hi From Flutter ReqRes &body=Hi From Flutter ReqRes"),
                      child: Row(
                        children: [
                          Icon(
                            Icons.email,
                            size: 30,
                            color: Constants.primary,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.email,
                                style: fontStyle2.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Email',
                                style: fontStyle.copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _launchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw 'Could not launch $url';
  }
}
