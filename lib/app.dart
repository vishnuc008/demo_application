import 'package:demo_application/Demo_App/presentation/routes/app_pages.dart';
import 'package:demo_application/Demo_App/presentation/routes/app_routes.dart';
import 'package:demo_application/Demo_App/presentation/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyAppp extends StatelessWidget {
  const MyAppp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.splashPage,
      theme: AppTheme.lightTheme,
      getPages: AppRoutes.routes,
    );
  }
}
