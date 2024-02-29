import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/model/buildtodotile.dart';
import 'package:test_1/model/myitems.dart';
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
          Obx(() => MyItems.myItemsList.isEmpty
              ? _buildCenterText()
              : _buildListView()),
        ],
      ),
    );
  }

  Widget _buildListView() => Expanded(
        child: ListView.builder(
          itemCount: MyItems.myItemsList.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8),
            child: Obx(
              () => BuildTodoTile(
                decoration: MyItems.myItemsList[index].isChecked.value == true
                    ? TextDecoration.lineThrough
                    : null,
                checkBoxicon:
                    MyItems.myItemsList[index].isChecked.value == false
                        ? Icons.check_box_outline_blank
                        : Icons.check_box,
                color: MyItems.myItemsList[index].isChecked.value == false
                    ? Colors.white
                    : const Color.fromRGBO(200, 255, 199, 1),
                onContainerTap: () {
                  MyItems.myItemsList[index].isChecked.value =
                      !MyItems.myItemsList[index].isChecked.value;
                },
                title: MyItems.myItemsList[index].title,
                description: MyItems.myItemsList[index].description,
                onEditTap: () {
                  MyItems.editMode = RxBool(true);
                  Get.toNamed(
                    DetailsPage.detailsPageRoute,
                    parameters: {
                      "title": MyItems.myItemsList[index].title,
                      "description": MyItems.myItemsList[index].description,
                      "id": index.toString(),
                    },
                  );
                },
                onDeleteTap: () {
                  Get.showSnackbar(
                    GetSnackBar(
                      titleText: Text(
                        MyItems.myItemsList[index].title,
                        style: const TextStyle(fontSize: 20),
                      ),
                      messageText: const Text(
                        "Successfully Deleted",
                        style: TextStyle(fontSize: 18),
                      ),
                      duration: const Duration(seconds: 2),
                      borderRadius: 25,
                      margin: const EdgeInsets.all(8),
                      backgroundColor: Colors.red[300]!,
                    ),
                  );
                  MyItems.myItemsList.removeAt(index);
                },
              ),
            ),
          ),
        ),
      );
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
}
