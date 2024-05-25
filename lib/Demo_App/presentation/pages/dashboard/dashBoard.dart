import 'package:demo_application/Demo_App/presentation/manager/controller/dashBoard_Controller.dart';
import 'package:demo_application/Demo_App/presentation/routes/app_pages.dart';
import 'package:demo_application/Demo_App/presentation/themes/app_assets.dart';
import 'package:demo_application/Demo_App/presentation/themes/app_colors.dart';
import 'package:demo_application/Demo_App/presentation/widgets/custom_Print.dart';
import 'package:demo_application/Demo_App/presentation/widgets/product/product_view.dart';
import 'package:demo_application/Demo_App/presentation/widgets/top_brands/top_brands.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:dots_indicator/dots_indicator.dart';

class DashBoard extends StatefulWidget {
  DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final dashboardController = Get.find<DashboardController>();
  @override
  void initState() {
    dashboardController.getproducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: w * 0.2,
          backgroundColor: AppColors.white,
          leading: Padding(
            padding: EdgeInsets.only(left: w * 0.05),
            child: Container(
              width: w,
              decoration: BoxDecoration(
                // color: AppColors.red,
                image: DecorationImage(image: AssetImage(AppAssets.demo)),
              ),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.person,
                  color: AppColors.black,
                )),
            Padding(
              padding: EdgeInsets.only(right: w * 0.02),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart,
                    color: AppColors.black,
                  )),
            ),
          ],
          bottom: AppBar(
            backgroundColor: AppColors.white,
            title: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search_outlined,
                  color: AppColors.black,
                ),
                hintText: "What are you looking for?",
                hintStyle: TextStyle(color: AppColors.black),
                fillColor: AppColors.grey,
                filled: true,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: AppColors.greyText,
                      width: 0.3,
                    )),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 0.3,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: AppColors.greyText,
                      width: 0.3,
                    )),
                disabledBorder: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.all(15),
              ),
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.fromLTRB(w * 0.02, h * 0.02, w * 0.02, h * 0.02),
          children: [
            SizedBox(
              height: h * 0.025,
            ),
            Stack(
              children: [
                ListView.builder(
                  itemCount: 1,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CarouselSlider(
                      options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            dashboardController.currentIndexPage.value = index;
                            customPrint(
                                "current page indexx==${dashboardController.currentIndexPage.value}");
                          },
                          height: h * 0.25,
                          autoPlay: true,
                          viewportFraction: 2),
                      items: dashboardController.carouselList.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(image: AssetImage(i))),
                            );
                          },
                        );
                      }).toList(),
                    );
                  },
                ),
                Obx(
                  () => Positioned(
                    left: w * 0.25,
                    top: h * 0.21,
                    child: DotsIndicator(
                      dotsCount: dashboardController.carouselList.length,
                      position: dashboardController.currentIndexPage.value,
                      decorator: DotsDecorator(
                        size: const Size(50.0, 3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        color: AppColors.white.withOpacity(0.2),
                        activeColor: AppColors.white,
                        activeSize: const Size(50.0, 3),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Text(
              "Recommended for you",
              style: TextStyle(
                  fontSize: w * 0.045,
                  color: AppColors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: h * 0.02,
            ),
            ProductViewMenu(),
            SizedBox(
              height: h * 0.02,
            ),
            Text(
              "Top Brands",
              style: TextStyle(
                  fontSize: w * 0.045,
                  color: AppColors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: h * 0.02,
            ),
            TopBrandsMenu(),
            SizedBox(
              height: h * 0.02,
            ),
            Container(
              height: h * 0.15,
              width: w,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppAssets.srkImg), fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: h * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
