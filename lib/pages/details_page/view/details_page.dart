import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test_1/model/myitems.dart';
import 'package:test_1/pages/details_page/controller/details_page_controller.dart';
import 'package:test_1/pages/home_page/view/home_page.dart';

class DetailsPage extends GetView<DetailsPageController> {
  const DetailsPage({super.key});
  static const detailsPageRoute = "/DetailsPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(220, 220, 220, 1),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 55,
          ),
          Form(
            child:
                _buildTextField("Title", 1, controller.titleController.value),
          ),
          _buildTextField(
            "Description",
            (MediaQuery.sizeOf(context).height / 40).round(),
            controller.descriptionController.value,
          ),
          const Expanded(child: SizedBox()),
          _buildSubmitButton(
            context,
            () {
              if (controller.titleController.value.text.isEmpty ||
                  controller.descriptionController.value.text.isEmpty) {
                return null;
              }

              if (MyItems.editMode == RxBool(true)) {
                controller.editToDo(
                  controller.titleController.value.text,
                  controller.descriptionController.value.text,
                  int.parse(Get.parameters["id"]!),
                );
                MyItems.editMode = RxBool(false);
                return Get.offAndToNamed(HomePage.homePageRoute);
              }

              controller.addToDo(controller.titleController.value.text,
                  controller.descriptionController.value.text);
              Get.offAndToNamed(HomePage.homePageRoute);
            },
          ),
        ],
      ),
    );
  }
}

Widget _buildTextField(
        String hintText, int? maxLines, TextEditingController? controller) =>
    Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        maxLines: maxLines,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.black,
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
Widget _buildSubmitButton(BuildContext context, Function()? onTap) => Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        borderRadius: BorderRadius.circular(25),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(25),
          child: Container(
            width: MediaQuery.sizeOf(context).width / 1,
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.5,
                color: Colors.black,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Center(
              child: Text("Submit"),
            ),
          ),
        ),
      ),
    );
