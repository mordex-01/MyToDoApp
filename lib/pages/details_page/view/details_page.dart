import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          _buildTextField("Title", 1),
          _buildTextField("Description", 20),
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 4.5,
          ),
          _buildSubmitButton(context),
        ],
      ),
    );
  }
}

Widget _buildTextField(String hintText, int? maxLines) => Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        maxLines: maxLines,
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
Widget _buildSubmitButton(BuildContext context) => Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        borderRadius: BorderRadius.circular(25),
        child: InkWell(
          onTap: () {
            Get.offAndToNamed(HomePage.homePageRoute);
          },
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
