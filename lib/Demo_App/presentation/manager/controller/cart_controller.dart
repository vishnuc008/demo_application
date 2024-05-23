import 'package:demo_application/Demo_App/domain/entities/cart_modal.dart';
import 'package:demo_application/Demo_App/presentation/themes/app_assets.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
final List<CartModal> cartlist=[
CartModal(AppAssets.smartphone, "iPhone 14 Pro max 256GB ", "Deep Purple..", "INR 1,50,000", "1"),
CartModal(AppAssets.smartphone, "iPhone 14 Pro max 256GB ", "Deep Purple..", "INR 1,50,000", "1"),
CartModal(AppAssets.smartphone, "iPhone 14 Pro max 256GB ", "Deep Purple..", "INR 1,50,000", "1"),

];
}