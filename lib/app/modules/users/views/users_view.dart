import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/theme.dart';
import '../controllers/users_controller.dart';

class UsersView extends GetView<UsersController> {
  UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(UsersController());
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
      body: GetBuilder<UsersController>(
        builder: (usersState) {
          return ListView.builder(
            padding: EdgeInsets.all(20),
            itemCount: usersState.users.length,
            itemBuilder: (context, i) {
              var d = usersState.users[i];
              return Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Constants.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(d.avatar),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${d.firstName} ${d.lastName}',
                              style: fontStyle.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          Text(
                            '${d.email}',
                            style: fontStyle.copyWith(fontSize: 14),
                          )
                        ],
                      ),
                    ],
                  ));
            },
          );
        },
      ),
      floatingActionButton: MaterialButton(
        onPressed: () {},
        height: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        color: Constants.primary,
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(
            Icons.add,
            color: Constants.white,
          ),
          SizedBox(width: 5),
          Text('Contact',
              style: fontStyle2.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ]),
      ),
    );
  }
}
