import 'package:get/get.dart';
import 'package:morphos_assignment/app/modules/network/controllers/network_controller.dart';

class NetworkBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    void dependencies() {
    Get.lazyPut<NetworkController>(
      () => NetworkController(),
    );
  }
  }
  
}