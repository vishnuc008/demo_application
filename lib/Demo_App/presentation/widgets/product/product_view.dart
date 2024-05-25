import 'package:demo_application/Demo_App/core/response_classify.dart';
import 'package:demo_application/Demo_App/data/remote/modals/response/product_Response_Modal.dart';
import 'package:demo_application/Demo_App/presentation/manager/controller/dashBoard_Controller.dart';
import 'package:demo_application/Demo_App/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../routes/app_pages.dart';

class ProductViewMenu extends StatefulWidget {
  const ProductViewMenu({super.key});

  @override
  State<ProductViewMenu> createState() => _ProductViewMenuState();
}

final dashboarController = Get.find<DashboardController>();

class _ProductViewMenuState extends State<ProductViewMenu> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Obx(() {
      if (dashboarController.productState.value.status == Status.LOADING) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (dashboarController.productList.isEmpty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: h * 0.1,
            ),
            Text("No Data Found"),
          ],
        );
      } else {
        return GridView.builder(
          physics: const ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.1),
          ),
          itemCount: dashboarController.productList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ProductViewItem(
              productResponseModal: dashboarController.productList[index],
            );
          },
        );
      }
    });
  }
}

class ProductViewItem extends StatefulWidget {
  const ProductViewItem({super.key, required this.productResponseModal});
  final ProductResponseModal productResponseModal;

  @override
  State<ProductViewItem> createState() => _ProductViewItemState();
}

final dashboardController = Get.find<DashboardController>();

class _ProductViewItemState extends State<ProductViewItem> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    var existingItem = dashboarController.cartList.any((p0) =>
        (p0.productResponseModal.id == widget.productResponseModal.id) == true);
    return Container(
      decoration: BoxDecoration(
          // color: AppColors.green,
          border: Border.all(color: AppColors.grey)),
      child: Padding(
        padding: EdgeInsets.fromLTRB(w * 0.01, h * 0.02, w * 0.01, h * 0.02),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: h * 0.15,
                  width: w * 0.25,
                  decoration: BoxDecoration(
                    // color: AppColors.red,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: widget.productResponseModal.image,
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
                SizedBox(
                  height: h * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: w * 0.07,
                      child: RawMaterialButton(
                        onPressed: () {
                          if (existingItem == true) {
                            Get.bottomSheet(
                              MyBottomSheet(widget.productResponseModal.title),
                            );
                          } else {
                            setState(() {
                              final subTotal =
                                  widget.productResponseModal.price * 1;
                              dashboardController.addToCart(
                                  widget.productResponseModal, 1, subTotal);
                            });
                          }
                        },
                        fillColor: AppColors.grey,
                        child: Icon(
                          existingItem ? Icons.check : Icons.add,
                          color: Colors.black,
                        ),
                        shape: const CircleBorder(),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: w * 0.4,
                      child: Text(
                        widget.productResponseModal.title,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: AppColors.pink,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: w * 0.3,
                      child: Text(
                        widget.productResponseModal.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        "INR",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.black.withOpacity(0.7),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        widget.productResponseModal.price.toStringAsFixed(2),
                        style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              color: AppColors.lightGreen,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    w * 0.01, h * 0.002, w * 0.01, h * 0.002),
                child: Text(
                  "HOT",
                  style: TextStyle(
                      fontSize: w * 0.031,
                      color: AppColors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
