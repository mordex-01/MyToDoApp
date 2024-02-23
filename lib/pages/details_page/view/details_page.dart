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
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ),
          Material(
            borderRadius: BorderRadius.circular(25),
            child: InkWell(
              onTap: () {
                Get.offAndToNamed(HomePage.homePageRoute);
              },
              borderRadius: BorderRadius.circular(25),
              child: Container(
                width: MediaQuery.sizeOf(context).width / 1.1,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Center(
                  child: Text("Submit"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
