import 'package:demo_application/Demo_App/domain/entities/profile_modal.dart';
import 'package:demo_application/Demo_App/presentation/manager/controller/profile_controller.dart';
import 'package:demo_application/Demo_App/presentation/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    final profilecontroller = Get.find<ProfileController>();
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: profilecontroller.profilelist.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        return ProfileItem(modal: profilecontroller.profilelist[index]);
      },
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.modal});
  final ProfileModal modal;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: Container(
          height: h * 0.07,
          width: w * 0.07,
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: w*0.13,
                height: h*0.055,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                    color: const Color.fromARGB(255, 245, 244, 244), 
                   ),
                child: Icon(
                  modal.icon.icon,
                    size: h * 0.03,
                  color: modal.color,
                ),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Text(modal.text,
                  style: TextStyle(
                      fontFamily: "Plus Jakarta Sans",
                      fontSize: 10,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500))
            ],
          ),
        ),
      ),
    );
  }
}
