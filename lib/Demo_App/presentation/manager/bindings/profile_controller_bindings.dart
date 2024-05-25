import 'package:demo_application/Demo_App/presentation/manager/controller/profile_controller.dart';
import 'package:get/get.dart';

class ProfileControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
