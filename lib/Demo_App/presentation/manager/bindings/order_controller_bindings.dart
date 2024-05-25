import 'package:demo_application/Demo_App/presentation/manager/controller/order_controller.dart';
import 'package:get/get.dart';

class OrderControllerBindings extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => OrderController());
  }

}