import 'package:fluttertoast/fluttertoast.dart';

class AppUtil{
  static void showToasts(String meg){
    Fluttertoast.showToast(msg: meg);
  }
}