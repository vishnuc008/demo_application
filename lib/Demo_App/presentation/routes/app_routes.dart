import 'package:demo_application/Demo_App/presentation/manager/bindings/cart_controller_bindings.dart';
import 'package:demo_application/Demo_App/presentation/pages/cart_page.dart';
import 'package:demo_application/Demo_App/presentation/pages/login_page.dart';
import 'package:demo_application/Demo_App/presentation/pages/signup_page.dart';
import 'package:demo_application/Demo_App/presentation/pages/splash_page.dart';
import 'package:demo_application/Demo_App/presentation/routes/app_pages.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes{
  static List<GetPage>routes=[
    GetPage(name: AppPages.splashPage, page: ()=> const SplashPage()),
    GetPage(name: AppPages.loginPage, page: ()=> const LoginPage()),
    GetPage(name: AppPages.signUp, page: ()=> const SignUpPage()),
    GetPage(name: AppPages.myCartPage, page: ()=> const MyCartPage(),binding: CartControllerBindings()),
  ];
}