import 'package:demo_application/Demo_App/presentation/routes/app_pages.dart';
import 'package:demo_application/Demo_App/presentation/themes/app_colors.dart';
import 'package:demo_application/Demo_App/presentation/widgets/oreder_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
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
            Get.toNamed(AppPages.dashboard);
          },
          icon: const Icon(Icons.arrow_back),
          color: AppColors.black,
        ),
        title: const Text("Orders",
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
            children: [OrderWidget()],
          ),
        ),
      ),
    ));
  }
}
