import 'package:demo_application/Demo_App/domain/entities/order_modal.dart';
import 'package:demo_application/Demo_App/presentation/routes/app_pages.dart';
import 'package:demo_application/Demo_App/presentation/themes/app_assets.dart';
import 'package:demo_application/Demo_App/presentation/themes/app_colors.dart';
import 'package:demo_application/Demo_App/presentation/widgets/cart_widget.dart';
import 'package:demo_application/Demo_App/presentation/widgets/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../manager/controller/dashBoard_Controller.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({super.key});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

final dashboardController = Get.find<DashboardController>();

class _MyCartPageState extends State<MyCartPage> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            dashboardController.getproducts();
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
          color: AppColors.black,
        ),
        title: const Text("My Cart",
            style: TextStyle(
                fontFamily: "Plus Jakarta Sans",
                fontSize: 16,
                color: AppColors.black,
                fontWeight: FontWeight.w600)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(w * 0.03, h * 0.02, w * 0.03, 0),
          child: const Column(
            children: [
              CartWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => dashboardController.cartList.isEmpty
            ? SizedBox.shrink()
            : Container(
                height: h * 0.29,
                width: w,
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 248, 245, 245)),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      w * 0.02, h * 0.015, w * 0.02, h * 0.02),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Order Info",
                              style: TextStyle(
                                  fontFamily: "Plus Jakarta Sans",
                                  fontSize: 16,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w700)),
                          Text("")
                        ],
                      ),
                      SizedBox(
                        height: h * 0.005,
                      ),
                      DottedLine(
                        height: 3.0,
                        dotSpacing: 5,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sub Total",
                              style: TextStyle(
                                  fontFamily: "Plus Jakarta Sans",
                                  fontSize: 14,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w600)),
                          Obx(
                            () => dashboardController.isTotalLoading.value
                                ? SizedBox.shrink()
                                : Text(
                                    "INR ${dashboardController.total.toStringAsFixed(2)}",
                                    style: TextStyle(
                                        fontFamily: "Plus Jakarta Sans",
                                        fontSize: 14,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w600)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Shipping Cost",
                              style: TextStyle(
                                  fontFamily: "Plus Jakarta Sans",
                                  fontSize: 14,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w600)),
                          Text("INR 200",
                              style: TextStyle(
                                  fontFamily: "Plus Jakarta Sans",
                                  fontSize: 14,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w600))
                        ],
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total",
                              style: TextStyle(
                                  fontFamily: "Plus Jakarta Sans",
                                  fontSize: 14,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w600)),
                          Obx(
                            () => dashboardController.isTotalLoading.value
                                ? SizedBox.shrink()
                                : Text(
                                    "INR ${dashboardController.totalPay.toStringAsFixed(2)}",
                                    style: TextStyle(
                                        fontFamily: "Plus Jakarta Sans",
                                        fontSize: 14,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w600)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      Obx(
                        () => dashboardController.addToOrderLoading.value
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : CustomGradientButton(
                                title: "Checkout",
                                onPressed: () {
                                  dashboardController
                                      .addToOrder(dashboardController.cartList);
                                 
                                }),
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    ));
  }
}

class DottedLine extends StatelessWidget {
  final double width;
  final double height;
  final double dotSpacing;
  final Color color;

  const DottedLine({
    Key? key,
    this.width = double.infinity,
    this.height = 1.0,
    this.dotSpacing = 4.0,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = constraints.constrainWidth();
        final dotCount = (boxWidth / (height + dotSpacing)).floor();

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dotCount, (index) {
            return Container(
              width: height,
              height: height,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            );
          }),
        );
      },
    );
  }
}
