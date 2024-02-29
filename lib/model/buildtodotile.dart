import 'package:flutter/material.dart';

class BuildTodoTile extends StatelessWidget {
  final String title;
  final String description;
  final void Function()? onDeleteTap;
  final void Function()? onEditTap;
  final void Function()? onContainerTap;
  final IconData? checkBoxicon;
  final Color? color;
  final TextDecoration? decoration;
  const BuildTodoTile({
    super.key,
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
