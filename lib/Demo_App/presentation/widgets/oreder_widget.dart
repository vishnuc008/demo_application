import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo_application/Demo_App/domain/entities/order_modal.dart';
import 'package:demo_application/Demo_App/presentation/manager/controller/dashBoard_Controller.dart';

import 'package:demo_application/Demo_App/presentation/themes/app_colors.dart';
import 'package:demo_application/Demo_App/presentation/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({super.key});

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

final dashboardController = Get.find<DashboardController>();

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Obx(() {
      if (dashboardController.addToOrderLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (dashboardController.orderList.isEmpty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: h * 0.2,
            ),
            Center(child: Text("No Order Found")),
          ],
        );
      } else {
        return ListView.builder(
          itemCount: dashboardController.orderList.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return OrderItem(modal: dashboardController.orderList[index]);
          },
        );
      }
    });
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.modal});
  final OrderModal modal;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
String formattedDate = formatDate(modal.orderTime);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: h * 0.23,
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
                    child: CachedNetworkImage(
                      imageUrl: modal.cartModal.productResponseModal.image,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => SizedBox(
                        height: h * 0.15,
                        width: w * 0.005,
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
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
                    SizedBox(
                      width: w * 0.5,
                      child: Text(modal.cartModal.productResponseModal.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontFamily: "Plus Jakarta Sans",
                              fontSize: 14,
                              color: AppColors.black,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      width: w * 0.5,
                      child: Text(
                          modal.cartModal.productResponseModal.description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontFamily: "Plus Jakarta Sans",
                              fontSize: 14,
                              color: AppColors.black,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(height: h * 0.01),
                    Row(
                      children: [
                        Text(formattedDate,
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 10,
                                color: AppColors.black,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          width: w * 0.03,
                        ),
                        Text("Ordered",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 10,
                                color: AppColors.green,
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                    SizedBox(height: h * 0.01),
                    Text("Qty :${modal.cartModal.quantity.toString()}",
                        style: TextStyle(
                            fontFamily: "Plus Jakarta Sans",
                            fontSize: 10,
                            color: AppColors.black,
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: h * 0.01),
                    Text(modal.cartModal.subtotal.toString(),
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
String formatDate(DateTime date) {
  final DateFormat formatter = DateFormat('dd/MM/yyyy');
  return formatter.format(date);
}
