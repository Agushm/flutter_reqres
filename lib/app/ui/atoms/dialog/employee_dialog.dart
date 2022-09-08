part of '../atoms.dart';

class EmployeeDialog extends StatelessWidget {
  final String? title;
  final Employee? employee;

  EmployeeDialog({@required this.title, @required this.employee});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      contentPadding: EdgeInsets.all(0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 5),
            width: double.infinity,
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () => Get.back(), icon: Icon(Icons.close)),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                title ?? "",
                style: fontStyle.copyWith(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                detailEmployee(title: 'Name', content: employee!.name),
                detailEmployee(title: 'Job', content: employee!.job),
                employee!.createdAt == null
                    ? SizedBox()
                    : detailEmployee(
                        title: 'Created At',
                        content: DateFormat('dd-MM-yyyy hh:mm').format(
                          DateTime.parse(employee!.createdAt!),
                        ),
                      ),
                employee!.updatedAt == null
                    ? SizedBox()
                    : detailEmployee(
                        title: 'Updated At',
                        content: DateFormat('dd-MM-yyyy hh:mm').format(
                          DateTime.parse(employee!.updatedAt!),
                        ),
                      ),
              ],
            ),
          ),
          SizedBox(height: 20),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: Constants.primary,
            onPressed: () => Get.back(),
            child: Text(
              'Close',
              style: fontStyle2.copyWith(color: Colors.white),
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}

Widget detailEmployee({String? title, String? content}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title!,
        style: fontStyle.copyWith(fontSize: 14),
      ),
      Text(
        content!,
        style: fontStyle2.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
      )
    ],
  );
}
