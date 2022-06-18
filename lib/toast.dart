import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

class CrunchToast {
  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      fontSize: 14.sp,
    );
  }
}
