import 'package:demo_application/Demo_App/presentation/themes/app_colors.dart';
import 'package:demo_application/Demo_App/presentation/widgets/profile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
          color: AppColors.black,
        ),
        title: const Text("My Profile",
            style: TextStyle(
                fontFamily: "Plus Jakarta Sans",
                fontSize: 16,
                color: AppColors.black,
                fontWeight: FontWeight.w600)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(w * 0.03, h * 0.02, w * 0.03, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Container(
                  height: h * 0.15,
                  width: w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.white),
                  child: Row(
                    children: [
                      SizedBox(
                        width: w * 0.025,
                      ),
                      Container(
                        width: w * 0.15,
                        decoration: const BoxDecoration(
                            color: AppColors.grey, shape: BoxShape.circle),
                        child: Center(
                            child: Icon(
                          Icons.person,
                          size: h * 0.045,
                        )),
                      ),
                      SizedBox(
                        width: w * 0.05,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Full Name",
                              style: TextStyle(
                                  fontFamily: "Plus Jakarta Sans",
                                  fontSize: 18,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: h * 0.01,
                          ),
                          Text("user@gmail.com",
                              style: TextStyle(
                                  fontFamily: "Plus Jakarta Sans",
                                  fontSize: 12,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w600))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.fromLTRB(w * 0.02, h * 0.04, w * 0.02, h * 0.01),
                child: Text("Dashboard",
                    style: TextStyle(
                        fontFamily: "Plus Jakarta Sans",
                        fontSize: 14,
                        color: AppColors.black,
                        fontWeight: FontWeight.w600)),
              ),
              ProfileWidget()
            ],
          ),
        ),
      ),
    ));
  }
}
