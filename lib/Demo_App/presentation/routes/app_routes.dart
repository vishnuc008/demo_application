import 'package:demo_application/Demo_App/presentation/pages/splash_page.dart';
import 'package:demo_application/Demo_App/presentation/routes/app_pages.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes{
  static List<GetPage>routes=[
    GetPage(name: AppPages.splashPage, page: ()=> const SplashPage()),
  ];
}