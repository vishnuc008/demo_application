import 'package:demo_application/Demo_App/presentation/manager/controller/dashBoard_Controller.dart';
import 'package:demo_application/Demo_App/presentation/themes/app_assets.dart';
import 'package:demo_application/Demo_App/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopBrandsMenu extends StatelessWidget {
  TopBrandsMenu({super.key});
  final dashboardController = Get.find<DashboardController>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.red,
      height: MediaQuery.of(context).size.height * 0.14,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: dashboardController.topBrandsList.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.14,
            width: MediaQuery.of(context).size.width * 0.2,
            child: TopBrandsItems(
              brandImage: dashboardController.topBrandsList[index],
            ),
          );
        },
      ),
    );
  }
}

class TopBrandsItems extends StatelessWidget {
  const TopBrandsItems({
    super.key,
    required this.brandImage,
  });
  final String brandImage;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(brandImage),
                    fit: BoxFit.contain,
                    alignment: Alignment.center),
              )),
        ],
      ),
    );
  }
}
