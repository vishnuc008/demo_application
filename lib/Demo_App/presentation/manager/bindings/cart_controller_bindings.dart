import 'package:demo_application/Demo_App/presentation/manager/controller/cart_controller.dart';
import 'package:get/get.dart';

class CartControllerBindings extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => CartController());
  }

}