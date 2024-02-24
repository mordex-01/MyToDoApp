import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class MyItems {
  MyItems({
    required this.title,
    required this.description,
  });
  String title;
  String description;
  RxBool isChecked = RxBool(false);
  static RxList<MyItems> myItemsList = <MyItems>[].obs;
  static RxBool editMode = RxBool(false);
}
