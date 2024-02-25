import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          Obx(
            () => MyItems.myItemsList.isEmpty
                ? _buildCenterText()
                : Expanded(
                    child: ListView.builder(
                      itemCount: MyItems.myItemsList.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: Obx(
                          () => _BuildTodoTile(
                            decoration:
                                MyItems.myItemsList[index].isChecked.value ==
                                        true
                                    ? TextDecoration.lineThrough
                                    : null,
                            checkBoxicon:
                                MyItems.myItemsList[index].isChecked.value ==
                                        false
                                    ? Icons.check_box_outline_blank
                                    : Icons.check_box,
                            color: MyItems.myItemsList[index].isChecked.value ==
                                    false
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
                                  "description":
                                      MyItems.myItemsList[index].description,
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
                  ),
          ),
        ],
      ),
    );
  }
}

class _BuildTodoTile extends StatelessWidget {
  final String title;
  final String description;
  final void Function()? onDeleteTap;
  final void Function()? onEditTap;
  final void Function()? onContainerTap;
  final IconData? checkBoxicon;
  final Color? color;
  final TextDecoration? decoration;
  const _BuildTodoTile({
    required this.title,
    required this.description,
    required this.onDeleteTap,
    required this.onEditTap,
    required this.onContainerTap,
    required this.color,
    required this.checkBoxicon,
    required this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: onContainerTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: color,
        ),
        width: 367,
        height: 142,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 20, decoration: decoration),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: SizedBox(
                    width: 230,
                    height: 90,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                        description,
                        style: TextStyle(decoration: decoration),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    checkBoxicon,
                    size: 33,
                  ),
                  InkWell(
                    onTap: onEditTap,
                    child: const Icon(
                      Icons.edit,
                      color: Colors.orange,
                      size: 33,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: onDeleteTap,
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 33,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
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
