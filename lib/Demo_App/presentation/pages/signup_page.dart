import 'package:demo_application/Demo_App/presentation/routes/app_pages.dart';
import 'package:demo_application/Demo_App/presentation/themes/app_assets.dart';
import 'package:demo_application/Demo_App/presentation/themes/app_colors.dart';
import 'package:demo_application/Demo_App/presentation/widgets/custom_button.dart';
import 'package:demo_application/Demo_App/presentation/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(w * 0.03, h * 0.02, w * 0.03, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: h * 0.03,
                    width: w * 0.2,
                    child: const Image(
                      image: AssetImage(AppAssets.demo),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: w * 0.1,
                    decoration: const BoxDecoration(
                        color: AppColors.grey, shape: BoxShape.circle),
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.close),
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.08,
              ),
              const Text(
                "Sign Up",
                style: TextStyle(
                    fontFamily: "Plus Jakarta Sans",
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              const Text("Let's create your account!",
                  style: TextStyle(
                      fontFamily: "Plus Jakarta Sans",
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
              SizedBox(
                height: h * 0.02,
              ),
              const LabelCustomTextField(
                  hintText: "Full Name", textFieldLabel: ""),
              const LabelCustomTextField(hintText: "Email", textFieldLabel: ""),
              const LabelCustomTextField(
                hintText: "Password",
                textFieldLabel: "",
                passwordfield: true,
              ),
              const LabelCustomTextField(
                hintText: "Confirm Password",
                textFieldLabel: "",
                passwordfield: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text("Already have an account?",
                          style: TextStyle(
                              fontFamily: "Plus Jakarta Sans",
                              fontSize: 14,
                              color: AppColors.black,
                              fontWeight: FontWeight.w400)),
                      TextButton(
                          onPressed: () {
                            Get.toNamed(AppPages.loginPage);
                          },
                          child: const Text("Login",
                              style: TextStyle(
                                  fontFamily: "Plus Jakarta Sans",
                                  fontSize: 14,
                                  color: AppColors.red,
                                  fontWeight: FontWeight.w400)))
                    ],
                  ),
                  const Text("")
                ],
              ),
              SizedBox(
                height: h * 0.1,
              ),
              Center(
                  child: CustomGradientButton(title: "Sign Up", onPressed: () {}))
            ],
          ),
        ),
      ),
    ));
  }
}
