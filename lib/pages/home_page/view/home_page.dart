import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/pages/details_page/view/details_page.dart';
import 'package:test_1/pages/home_page/controller/home_page_controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});
  static const String homePageRoute = "/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: _buildAddActionButton(),
      backgroundColor: const Color.fromRGBO(220, 220, 220, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildCenterText(),
        ],
      ),
    );
  }
}

Widget _buildAddActionButton() => FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: () {
        Get.toNamed(DetailsPage.detailsPageRoute);
      },
      child: const Icon(
        Icons.add,
        size: 35,
        color: Colors.black,
      ),
    );
Widget _buildCenterText() => const Center(
      child: Column(
        children: [
          Text(
            "The List Is Empty",
            style: TextStyle(fontSize: 26),
          ),
          Text(
            "Please add item",
            style: TextStyle(fontSize: 21),
          ),
        ],
      ),
    );
