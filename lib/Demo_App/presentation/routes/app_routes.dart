

import 'package:demo_application/Demo_App/presentation/manager/bindings/profile_controller_bindings.dart';
import 'package:demo_application/Demo_App/presentation/pages/account_details_page.dart';
import 'package:demo_application/Demo_App/presentation/pages/cart_page.dart';
import 'package:demo_application/Demo_App/presentation/pages/login_page.dart';
import 'package:demo_application/Demo_App/presentation/pages/order_page.dart';
import 'package:demo_application/Demo_App/presentation/pages/profile_page.dart';
import 'package:demo_application/Demo_App/presentation/pages/signup_page.dart';

import 'package:demo_application/Demo_App/presentation/manager/bindings/dashboard_bindings.dart';
import 'package:demo_application/Demo_App/presentation/pages/dashboard/dashBoard.dart';

import 'package:demo_application/Demo_App/presentation/pages/splash_page.dart';
import 'package:demo_application/Demo_App/presentation/routes/app_pages.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes{
  static List<GetPage>routes=[
    GetPage(name: AppPages.splashPage, page: ()=> const SplashPage()),
    GetPage(name: AppPages.loginPage, page: ()=> const LoginPage()),
    GetPage(name: AppPages.signUp, page: ()=> const SignUpPage()),
    GetPage(name: AppPages.myCartPage, page: ()=> const MyCartPage(),binding: DashBoardBindings()),
    GetPage(name: AppPages.orderPage, page: ()=> const OrderPage(),binding: DashBoardBindings()),
    GetPage(name: AppPages.profilePage, page: ()=> const ProfilePage(),binding: ProfileControllerBindings()),
    GetPage(name: AppPages.accountDetailsPage, page: ()=> const AccountDetailsPage()),
    GetPage(name: AppPages.dashboard, page: ()=>  DashBoard(),binding: DashBoardBindings()),
  ];
}