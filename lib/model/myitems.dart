import 'package:get/get.dart';

class MyItems {
  MyItems({required this.title, required this.description});
  String title;
  String description;
  static RxList<MyItems> myItemsList = <MyItems>[].obs;
}
