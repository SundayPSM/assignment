// import 'dart:html';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:morphos_assignment/app/data/hiveBox.dart';
import 'package:morphos_assignment/app/modules/home/models/product_model.dart';
import 'package:morphos_assignment/app/modules/home/views/widgets/product_tile.dart';
import 'package:morphos_assignment/app/modules/network/controllers/network_controller.dart';

import '../controllers/home_controller.dart';

import 'package:hive_flutter/hive_flutter.dart';

class HomeView extends GetView<HomeController> {
  final homeController = Get.find<HomeController>();
  final networkController = Get.put(NetworkController());

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Morphos'),
        centerTitle: true,
      ),
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: TextFormField(
                style: Theme.of(context).textTheme.bodyText1,
                onChanged: (value) {
                  textEditingController.text = value;
                },
                // controller: textEditingController,
                decoration: InputDecoration(
                  prefixIcon: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Icon(
                      Icons.search,
                      size: 25,
                    ),
                  ),
                  hintText: "Search by Product Name",
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0XFF0A1612), width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Obx(() {
              return networkController.connectionStatus.value == 0
                  ? Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Text(
                        "Please trun on your internet",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.white),
                      ),
                    )
                  : Container();
            }),
            Obx(() => Expanded(
                  child: homeController.isLoading.value
                      ? Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : ValueListenableBuilder(
                          valueListenable: Boxes.getProducts().listenable(),
                          builder: (context, Box<Product> products, _) {
                            List<Product> listProducts =
                                textEditingController.value.text.isEmpty
                                    ? products.values.cast<Product>().toList()
                                    : products.values.where((element) {
                                        if (element.name!
                                            .toLowerCase()
                                            .contains(textEditingController
                                                .value.text
                                                .toLowerCase())) {
                                          return true;
                                        } else {
                                          return false;
                                        }
                                      }).toList();
                            return listProducts.length == 0
                                ? Container(
                                    child: Center(
                                      child: Text(
                                        "No Product Found",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: listProducts.length,
                                    itemBuilder: (context, index) {
                                      final product = listProducts[index];
                                      return ProductTile(
                                        product: product,
                                      );
                                    });
                          }),
                ))
          ],
        ),
      ),
    );
  }
}
