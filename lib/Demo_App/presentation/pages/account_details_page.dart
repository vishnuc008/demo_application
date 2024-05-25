import 'package:demo_application/Demo_App/presentation/themes/app_colors.dart';
import 'package:demo_application/Demo_App/presentation/widgets/custom_button.dart';
import 'package:demo_application/Demo_App/presentation/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AccountDetailsPage extends StatefulWidget {
  const AccountDetailsPage({super.key});

  @override
  State<AccountDetailsPage> createState() => _AccountDetailsPageState();
}

class _AccountDetailsPageState extends State<AccountDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
    appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
          color: AppColors.black,
        ),
        title: const Text("Account Details",
            style: TextStyle(
                fontFamily: "Plus Jakarta Sans",
                fontSize: 16,
                color: AppColors.black,
                fontWeight: FontWeight.w600)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.fromLTRB(w * 0.04, h * 0.02, w * 0.04, 0),
          child: Column(
            children: [
              SizedBox(height: h*0.02,),
              LabelCustomTextField(hintText: "Full Name", textFieldLabel: "Full Name"),
               SizedBox(height: h*0.02,),
               LabelCustomTextField(hintText: "Email", textFieldLabel: "Email"),
                SizedBox(height: h*0.02,),
                LabelCustomTextField(hintText: "New Password", textFieldLabel: "New Password"),
                 SizedBox(height: h*0.02,),
                 LabelCustomTextField(hintText: "Confirm Password", textFieldLabel: "Confirm Password"),
                  SizedBox(height: h*0.25,),
                 CustomGradientButton(title: "Save", onPressed: (){})

            ],
          ),
        ),
      ),
    ));
  }
}