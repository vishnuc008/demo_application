import 'package:demo_application/Demo_App/presentation/themes/app_assets.dart';
import 'package:demo_application/Demo_App/presentation/themes/app_colors.dart';
import 'package:demo_application/Demo_App/presentation/widgets/cart_widget.dart';
import 'package:demo_application/Demo_App/presentation/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({super.key});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

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
      bottomNavigationBar: Container(
        height: h * 0.28,
        width: w,
        decoration: BoxDecoration(color: Color.fromARGB(255, 248, 245, 245)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(w * 0.02, h * 0.015, w * 0.02, h * 0.02),
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
                  Text("INR 1,50,000",
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
                  Text("INR 1,50,200",
                      style: TextStyle(
                          fontFamily: "Plus Jakarta Sans",
                          fontSize: 14,
                          color: AppColors.black,
                          fontWeight: FontWeight.w600))
                ],
              ),
              SizedBox(
                height: h * 0.03,
              ),
              CustomGradientButton(
                  title: "Checkout",
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: h * 0.35,
                          width: w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(""),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Container(
                                      width: w * 0.1,
                                      decoration: const BoxDecoration(
                                          color: AppColors.grey,
                                          shape: BoxShape.circle),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(bottom: h * 0.00),
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.close),
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                               // height: h * 0.08,
                                width: w * 0.19,
                                child: Image(image: AssetImage(AppAssets.mark),fit: BoxFit.cover,),
                              ),
                              SizedBox(height: h*0.03,),
                              Text("Your Order Was Successfully Placed",style: TextStyle(
                          fontFamily: "Plus Jakarta Sans",
                          fontSize: 16,
                          color: AppColors.black,
                          fontWeight: FontWeight.w600)),
                              Text(
                                  "You’ll receive an email at  elisha2018@gmail.com once ",
                                  style: TextStyle(
                          fontFamily: "Plus Jakarta Sans",
                          fontSize: 10,
                          color: AppColors.black,
                          fontWeight: FontWeight.w400)),
                          SizedBox(height: h*0.02,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: h * 0.068,
                                        width: w * 0.09,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: AppColors.black)),
                                        child: Center(
                                          child: const Text(
                                            "Continue Shopping",
                                            style: TextStyle(
                                                fontFamily: "Plus Jakarta Sans",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: w*0.03,),
                                    Expanded(
                                        child: CustomGradientButton(
                                            title: "View Order",
                                            onPressed: () {}))
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }),
              SizedBox(
                height: h * 0.01,
              ),
            ],
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
