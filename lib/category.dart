import 'dart:io';
import 'package:e_commerce/home.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Category extends StatefulWidget {
  final String category;
  final int categoryIndex;

  const Category({
    Key? key,
    required this.category,
    required this.categoryIndex,
  }) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final ImagePicker picker = ImagePicker();
  XFile? cameraPhoto;
  XFile? galleryPhoto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color(0xFF32125B),
        title: Text(
          widget.category,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: category[widget.categoryIndex]["image"].length,
          itemBuilder: (
            BuildContext context,
            int index,
          ) {
            return Stack(
              children: [
                Image.file(
                  File(
                    category[widget.categoryIndex]["image"][index],
                  ),
                  fit: BoxFit.fill,
                ),
                Container(
                  alignment: Alignment.topRight,
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF).withOpacity(0.08),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                              "Are you sure you want to delete this item",
                            ),
                            content: const Text(
                              "Once you delete this item, you can't restore it",
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "No",
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  category[widget.categoryIndex]["image"]
                                      .removeAt(index);
                                  Navigator.pop(context);
                                  setState(() {});
                                },
                                child: const Text(
                                  "Yes",
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Color(0xFFEDE9FF),
                      size: 12,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      extendBody: true,
      bottomNavigationBar: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xFF32125B),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              Navigator.of(context).pop();
                              cameraPhoto = await picker.pickImage(
                                source: ImageSource.camera,
                              );
                              if (cameraPhoto != null) {
                                category[widget.categoryIndex]["image"].add(
                                  cameraPhoto?.path,
                                );
                              }
                              setState(() {});
                            },
                            child: Column(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 10,
                                  ),
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Color(0xFFEDE9FF),
                                  ),
                                ),
                                Text(
                                  "Camera",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFEDE9FF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () async {
                              Navigator.of(context).pop();
                              galleryPhoto = await picker.pickImage(
                                source: ImageSource.gallery,
                              );
                              if (galleryPhoto != null) {
                                category[widget.categoryIndex]["image"].add(
                                  galleryPhoto?.path,
                                );
                              }
                              setState(() {});
                            },
                            child: Column(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 10,
                                  ),
                                  child: Icon(
                                    Icons.photo,
                                    color: Color(0xFFEDE9FF),
                                  ),
                                ),
                                Text(
                                  "Gallery",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFEDE9FF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: Container(
          height: 50,
          margin: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFF32125B),
          ),
          alignment: Alignment.center,
          child: const Icon(
            Icons.add,
            color: Color(0xFFEDE9FF),
          ),
        ),
      ),
    );
  }
}
