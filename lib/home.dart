import 'package:e_commerce/category.dart';
import 'package:flutter/material.dart';

List category = [
  {
    "category": "Electronic",
    "image": [],
  },
  {
    "category": "Fashion",
    "image": [],
  },
  {
    "category": "Beauty",
    "image": [],
  },
  {
    "category": "Home decor",
    "image": [],
  },
];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formKey = GlobalKey<FormState>();
  TextEditingController categoryName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color(0xFF32125B),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF).withOpacity(0.08),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: const UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                accountName: Text(
                  "kenil",
                  style: TextStyle(
                    color: Color(0xFFEDE9FF),
                  ),
                ),
                accountEmail: Text(
                  "kenildiyora2002@gmail.com",
                  style: TextStyle(
                    color: Color(0xFFEDE9FF),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Category",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFEDE9FF),
                    ),
                  ),
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: category.length,
                    itemBuilder: (
                      BuildContext context,
                      index,
                    ) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Category(
                                category: category[index]["category"],
                                categoryIndex: index,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 5,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF).withOpacity(0.08),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                category[index]["category"],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xFFEDE9FF),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFFFFF)
                                      .withOpacity(0.08),
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
                                                category.removeAt(index);
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
                          ),
                        ),
                      );
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Material(
                                color: Colors.transparent,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                  ),
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                    left: 20,
                                    right: 20,
                                    bottom: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF32125B),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Form(
                                    key: formKey,
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Add category",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFFEDE9FF),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 20,
                                          ),
                                          child: TextFormField(
                                            controller: categoryName,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Enter category name";
                                              }
                                              return null;
                                            },
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFFEDE9FF),
                                            ),
                                            decoration: InputDecoration(
                                              fillColor: const Color(0xFFFFFFFF)
                                                  .withOpacity(0.08),
                                              filled: true,
                                              hintText: "Category name",
                                              hintStyle: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFFEDE9FF),
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                top: 15.5,
                                                left: 16,
                                                bottom: 15.5,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                borderSide: const BorderSide(
                                                  color: Color(0xFFEDE9FF),
                                                  width: 1,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                borderSide: const BorderSide(
                                                  color: Color(0xFFEDE9FF),
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFF6536F3),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            elevation: 0,
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 15,
                                            ),
                                          ),
                                          onPressed: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              category.add(
                                                {
                                                  "category": categoryName.text,
                                                  "image": [],
                                                },
                                              );
                                              Navigator.of(context).pop();
                                            }
                                            setState(() {});
                                          },
                                          child: const Center(
                                            child: Text(
                                              "Submit",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 13,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF).withOpacity(0.08),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.add,
                        color: Color(0xFFEDE9FF),
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color(0xFF32125B),
        title: const Text(
          "eCommerce",
        ),
      ),
    );
  }
}
