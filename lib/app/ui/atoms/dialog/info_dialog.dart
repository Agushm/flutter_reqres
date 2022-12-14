part of '../atoms.dart';

class InfoDialog extends StatelessWidget {
  final String? title;
  final String? message;
  final Function()? onPressed;
  final String? btnText;

  InfoDialog(
      {@required this.title,
      @required this.message,
      this.onPressed,
      this.btnText});

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
            child: Text(
              message ?? "Message",
              textAlign: TextAlign.center,
              style: fontStyle.copyWith(fontSize: 18),
            ),
          ),
          SizedBox(height: 20),
          onPressed != null
              ? MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  color: Constants.primary,
                  onPressed: onPressed,
                  child: Text('$btnText',
                      style: fontStyle.copyWith(color: Colors.white)))
              : SizedBox(),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
