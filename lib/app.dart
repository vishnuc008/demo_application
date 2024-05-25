import 'dart:io';

import 'package:demo_application/Demo_App/presentation/routes/app_pages.dart';
import 'package:demo_application/Demo_App/presentation/routes/app_routes.dart';
import 'package:demo_application/Demo_App/presentation/themes/app_themes.dart';
import 'package:demo_application/Demo_App/presentation/widgets/custom_alert_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MyAppp extends StatelessWidget {
  const MyAppp({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        customAlertDialogue(
            title: "Exit!",
            content: "Are you Sure You Want to Exit",
            txtbutton1Action: () {
              exit(0);
            },
            txtbutton2Action: () {
              Get.back();
            },
            txtbuttonName1: "Yes",
            txtbuttonName2: "No",
            );
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.splashPage,
        theme: AppTheme.lightTheme,
        getPages: AppRoutes.routes,
      ),
    );
  }
}
