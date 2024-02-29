import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/model/myitems.dart';

class DetailsPageController extends GetxController {
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> descriptionController = TextEditingController().obs;
  final formKey = GlobalKey<FormState>();
  addToDo(String title, String description) {
    MyItems.myItemsList.add(
      MyItems(
        title: title,
        description: description,
      ),
    );
  }

  editToDo(String title, String description, int id) {
    MyItems.myItemsList[id].title = title;
    MyItems.myItemsList[id].description = description;
  }

  @override
  void onInit() {
    var data = Get.parameters;
    if (MyItems.editMode == RxBool(true)) {
      titleController.value.text = data['title']!;
      descriptionController.value.text = data['description']!;
    }
    super.onInit();
  }
}
