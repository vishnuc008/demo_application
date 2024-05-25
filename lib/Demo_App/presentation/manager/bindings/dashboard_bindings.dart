import 'package:demo_application/Demo_App/presentation/manager/controller/dashBoard_Controller.dart';
import 'package:demo_application/injector.dart';
import 'package:get/get.dart';

class DashBoardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DashboardController(getIt()),
    );
  }
}
