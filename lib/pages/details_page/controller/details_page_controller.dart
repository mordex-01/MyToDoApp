import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/model/myitems.dart';

class DetailsPageController extends GetxController {
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> descriptionController = TextEditingController().obs;
  addToDo(String title, String description) {
    MyItems.myItemsList.add(MyItems(title: title, description: description));
  }
}
