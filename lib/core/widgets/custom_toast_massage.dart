import 'package:fluttertoast/fluttertoast.dart';
import 'package:wafir_mobile/core/resource/manager_colors.dart';

mixin CustomToastMassage {
  void showToast(String message, [bool isError = true]) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor:
            isError ? ManagerColors.failureColor : ManagerColors.buttonColor,
        fontSize: 16.0);

  }
}
