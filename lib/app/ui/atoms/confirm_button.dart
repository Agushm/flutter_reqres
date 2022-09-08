part of 'atoms.dart';

class ConfirmButton extends GetView {
  const ConfirmButton(
      {Key? key, this.onPressed, this.label, this.isLoading = false})
      : super(key: key);
  final bool isLoading;
  final String? label;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        disabledColor: Constants.primary.withOpacity(0.5),
        height: 60,
        onPressed: null,
        child: Container(
            width: 20, height: 20, child: CircularProgressIndicator()),
      );
    }
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Constants.primary,
      height: 60,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label!,
            style: fontStyle2.copyWith(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
