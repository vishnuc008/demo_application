import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo_application/Demo_App/presentation/manager/controller/dashBoard_Controller.dart';

import 'package:demo_application/Demo_App/presentation/themes/app_colors.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../domain/entities/Cart_Modal.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  final dashboardController = Get.find<DashboardController>();
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Obx(() {
      if (dashboardController.cartList.isEmpty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: h * 0.2,
            ),
            Center(child: Text("Cart Is Empty")),
          ],
        );
      } else if (dashboardController.isRemoveCart.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: dashboardController.cartList.length,
          itemBuilder: (context, index) {
            return CartItem(
                modal: dashboardController.cartList[index],
                countNotifier: ValueNotifier<int>(
                    dashboardController.cartList[index].quantity));
          },
        );
      }
    });
  }
}

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.modal, required this.countNotifier});
  final CartModal modal;
  final ValueNotifier<int> countNotifier;

  @override
  State<CartItem> createState() => _CartItemState();
}
final dashboardController = Get.find<DashboardController>();
class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: h * 0.16,
        width: w,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey),
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 248, 245, 245)),
        child: Row(
          children: [
            Container(
              height: h * 0.16,
              width: w * 0.25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  color: AppColors.cardcolor),
              child: CachedNetworkImage(
                imageUrl: widget.modal.productResponseModal.image,
                fit: BoxFit.cover,
                placeholder: (context, url) => SizedBox(
                  height: h * 0.15,
                  width: w * 0.005,
                  child: const Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            SizedBox(
              width: w * 0.02,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: h * 0.01),
                SizedBox(
                  width: w * 0.5,
                  child: Text(widget.modal.productResponseModal.title,
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
                  child: Text(widget.modal.productResponseModal.description,
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
                Text("INR ${widget.modal.subtotal.toStringAsFixed(2)}",
                    style: TextStyle(
                        fontFamily: "Plus Jakarta Sans",
                        fontSize: w * 0.03,
                        color: AppColors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w600)),
                Row(
                  children: [
                    SizedBox(
                      width: w * 0.07,
                      child: RawMaterialButton(
                        onPressed: () {
                          if (widget.countNotifier.value > 0) {
                            widget.countNotifier.value--;
                            debugPrint(
                                "count notifier=${widget.countNotifier.value}");
                            dashboardController.removeFromcart(
                                widget.modal.productResponseModal,
                                widget.countNotifier.value,
                                dashboardController.subtotalcalculation(
                                    widget.modal.productResponseModal.price,
                                    widget.countNotifier.value));
                          }
                        },
                        fillColor: AppColors.black,
                        child: Icon(
                          size: 22,
                          Icons.minimize_outlined,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.only(bottom: h * 0.015),
                        shape: const CircleBorder(),
                      ),
                    ),
                    SizedBox(
                      width: w * 0.02,
                    ),
                    ValueListenableBuilder(
                      valueListenable: widget.countNotifier,
                      builder: (context, value, child) {
                        return Text(
                          "${widget.countNotifier.value}",
                          style: const TextStyle(
                            color: AppColors.black,
                            fontFamily: "Plus Jakarta Sans",
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      width: w * 0.02,
                    ),
                    SizedBox(
                      width: w * 0.07,
                      child: RawMaterialButton(
                        onPressed: () {
                          widget.countNotifier.value++;
                          dashboardController.addToCart(
                              widget.modal.productResponseModal,
                              widget.countNotifier.value,
                              dashboardController.subtotalcalculation(
                                  widget.modal.productResponseModal.price,
                                  widget.countNotifier.value));
                        },
                        fillColor: AppColors.black,
                        child: Icon(
                          size: 22,
                          Icons.add,
                          color: Colors.white,
                        ),
                        shape: const CircleBorder(),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: w * 0.07,
                  decoration: BoxDecoration(
                      color: AppColors.red, shape: BoxShape.circle),
                  child: IconButton(
                    padding: EdgeInsets.only(bottom: w * 0.01, top: h * 0.005),
                    onPressed: () {
                      dashboardController.deletefromcart(widget.modal);
                    },
                    icon: Icon(Icons.delete),
                    color: AppColors.white,
                    iconSize: 14,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
