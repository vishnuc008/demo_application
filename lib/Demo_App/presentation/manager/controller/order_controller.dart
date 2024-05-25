import 'package:demo_application/Demo_App/domain/entities/order_modal.dart';
import 'package:demo_application/Demo_App/presentation/themes/app_assets.dart';
import 'package:get/get.dart';

class OrderController extends GetxController{
final List<OrderModal> orderlist=[
OrderModal(AppAssets.smartphone, "iPhone 14 Pro max 256GB", "Deep Purple..", "INR 1,50,000", "21/07/2023", "ordered"),
OrderModal(AppAssets.smartphone, "iPhone 14 Pro max 256GB", "Deep Purple..", "INR 1,50,000", "21/07/2023", "ordered"),
OrderModal(AppAssets.smartphone, "iPhone 14 Pro max 256GB", "Deep Purple..", "INR 1,50,000", "21/07/2023", "ordered")
];
}