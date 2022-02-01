import 'package:get/get.dart';
import 'package:morphos_assignment/app/data/hiveBox.dart';
import 'package:morphos_assignment/app/modules/home/models/product_model.dart';
import 'package:morphos_assignment/app/modules/home/providers/product_provider.dart';
import 'package:morphos_assignment/app/modules/network/controllers/network_controller.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  var listOfProducts = [].obs;
  final isLoading = false.obs;

  late NetworkController networkController;

  final box = Boxes.getProducts();
  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;
    networkController = Get.put(NetworkController());
    print("I am here");
    List<dynamic> products = await ProductProvider().getProducts();

    if (products.length > 0 && networkController.connectionStatus.value > 0) {
      products.forEach((product) {
        listOfProducts.add(Product.fromJson(product));
        box.add(Product.fromJson(product));
      });

      print("Length of listOfProducts is ${listOfProducts.length}");
    }
    isLoading.value=false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    Boxes.getProducts().clear();
  }

  void increment() => count.value++;
}
