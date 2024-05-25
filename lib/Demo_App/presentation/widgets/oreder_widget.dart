import 'package:demo_application/Demo_App/domain/entities/order_modal.dart';
import 'package:demo_application/Demo_App/presentation/manager/controller/order_controller.dart';
import 'package:demo_application/Demo_App/presentation/themes/app_colors.dart';
import 'package:demo_application/Demo_App/presentation/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({super.key});

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    final ordercontroller = Get.find<OrderController>();
    return ListView.builder(
      itemCount: ordercontroller.orderlist.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return OrderItem(modal: ordercontroller.orderlist[index]);
      },
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.modal});
  final OrderModal modal;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: h * 0.2,
        width: w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 248, 245, 245)),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: h * 0.02),
                  child: Container(
                    height: h * 0.1,
                    width: w * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        color: AppColors.cardcolor),
                    child: Image(
                      image: AssetImage(modal.img),
                      height: h * 0.07,
                    ),
                  ),
                ),
                SizedBox(
                  width: w * 0.03,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(modal.productName,
                        style: TextStyle(
                            fontFamily: "Plus Jakarta Sans",
                            fontSize: 14,
                            color: AppColors.black,
                            fontWeight: FontWeight.w600)),
                    Text(modal.productColor,
                        style: TextStyle(
                            fontFamily: "Plus Jakarta Sans",
                            fontSize: 14,
                            color: AppColors.black,
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: h * 0.01),
                    Row(
                      children: [
                        Text(modal.date,
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 10,
                                color: AppColors.black,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          width: w * 0.03,
                        ),
                        Text(modal.status,
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 10,
                                color: AppColors.green,
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                    SizedBox(height: h * 0.01),
                    Text(modal.amount,
                        style: TextStyle(
                            fontFamily: "Plus Jakarta Sans",
                            fontSize: 10,
                            color: AppColors.black,
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: h * 0.01),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      height: h * 0.05,
                      width: w * 0.09,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.black)),
                      child: Center(
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                              fontFamily: "Plus Jakarta Sans",
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: w * 0.03,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: SizedBox(
                      height: h * 0.05,
                      width: w * 0.9,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.black),
                        onPressed: () {},
                        child: Text(
                          "Reorder",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
