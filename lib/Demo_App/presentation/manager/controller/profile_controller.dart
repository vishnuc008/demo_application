import 'dart:io';

import 'package:demo_application/Demo_App/domain/entities/profile_modal.dart';
import 'package:demo_application/Demo_App/presentation/routes/app_pages.dart';
import 'package:demo_application/Demo_App/presentation/themes/app_colors.dart';
import 'package:demo_application/Demo_App/presentation/widgets/custom_alert_dialogue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final List<ProfileModal> profilelist = [
    ProfileModal(
        Icon(Icons.person), "Account Details", () {}, AppColors.iconcolor),
    ProfileModal(Icon(Icons.grid_view_rounded), "Orders", () {
      Get.toNamed(AppPages.orderPage);
    }, AppColors.red),
    ProfileModal(Icon(Icons.key_outlined), "Logout", () {
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
    }, AppColors.iconcolor),
  ];
}
