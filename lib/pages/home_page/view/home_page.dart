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
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: MyItems.myItemsList.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8),
                  child: _BuildTodoTile(
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
                      MyItems.myItemsList.removeAt(index);
                    },
                  ),
                ),
              ),
            ),
          )
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
  const _BuildTodoTile({
    required this.title,
    required this.description,
    required this.onDeleteTap,
    required this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromRGBO(200, 255, 199, 1),
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
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(description),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8, left: 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.check,
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
