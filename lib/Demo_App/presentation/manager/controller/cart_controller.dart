import 'package:demo_application/Demo_App/domain/entities/cart_dummy_modal.dart';
import 'package:demo_application/Demo_App/domain/entities/cart_modal.dart';
import 'package:demo_application/Demo_App/presentation/themes/app_assets.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
final List<CartDummyModal> cartlist=[
CartDummyModal(AppAssets.smartphone, "iPhone 14 Pro max 256GB ", "Deep Purple..", "INR 1,50,000", "1"),
CartDummyModal(AppAssets.smartphone, "iPhone 14 Pro max 256GB ", "Deep Purple..", "INR 1,50,000", "1"),
CartDummyModal(AppAssets.smartphone, "iPhone 14 Pro max 256GB ", "Deep Purple..", "INR 1,50,000", "1"),


];
}