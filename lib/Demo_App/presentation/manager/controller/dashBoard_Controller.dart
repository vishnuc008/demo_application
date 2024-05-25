import 'package:demo_application/Demo_App/presentation/routes/app_pages.dart';
import 'package:demo_application/Demo_App/presentation/themes/app_assets.dart';
import 'package:demo_application/Demo_App/presentation/widgets/custom_Print.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/response_classify.dart';
import '../../../core/usecase.dart';
import '../../../data/remote/modals/response/product_Response_Modal.dart';
import '../../../domain/entities/Cart_Modal.dart';
import '../../../domain/usecases/product_usecase.dart';
import '../../themes/app_colors.dart';

class DashboardController extends GetxController {
  final ProductsUseCase productsUseCase;
  DashboardController(this.productsUseCase);
  final carouselList = <String>[
    AppAssets.watchImg,
    AppAssets.watchImg,
    AppAssets.watchImg,
  ];

  final currentIndexPage = 0.obs;

  final topBrandsList = <String>[
    AppAssets.apple,
    AppAssets.realmeImage,
    AppAssets.sonyImage,
    AppAssets.miImage,
    AppAssets.samsungImage,
  ];

  final productState =
      ResponseClassify<List<ProductResponseModal>>.error("").obs;
  final productList = <ProductResponseModal>[];
  final isproductLoading = false.obs;
  getproducts() async {
    productState.value = ResponseClassify.loading();

    try {
      productState.value =
          ResponseClassify.completed(await productsUseCase.call(NoParams()));
      productList.clear();

      customPrint("product list cleared");

      productList.addAll(productState.value.data!);

      customPrint("product list length==${productList.length}");
    } catch (e) {
      productState.value = ResponseClassify.error("$e");
    }
  }

  final cartList = <CartModal>[].obs;
  addToCart(ProductResponseModal modal, int quantity, subTotal) {
    CartModal cartModal = CartModal(modal, quantity, subTotal);
    int existingIndex = cartList.indexWhere((element) =>
        element.productResponseModal == cartModal.productResponseModal);
    if (existingIndex != -1) {
      CartModal existingCartModal = cartList[existingIndex];
      cartList.remove(existingCartModal);

      existingCartModal = CartModal(
        modal,
        existingCartModal.quantity + 1,
        subTotal,
      );

      cartList.add(existingCartModal);
    } else {
      cartList.add(cartModal);
      Get.bottomSheet(
        MyBottomSheet(cartModal.productResponseModal.title),
      );
    }
    cartList.refresh();
    getTotal(cartList);
    cartList.sort(
      (a, b) {
        return a.productResponseModal.title
            .compareTo(b.productResponseModal.title);
      },
    );
  }

  var total = 0.0;
  final isTotalLoading = false.obs;
  getTotal(List<CartModal> list) {
    isTotalLoading.value = true;
    total = 0.0;
    for (var i in list) {
      total = total + i.subtotal;
    }
    isTotalLoading.value = false;
  }
}

class MyBottomSheet extends StatelessWidget {
  final String title;
  MyBottomSheet(this.title);
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.lightGreen,
                backgroundImage: AssetImage(AppAssets.bottomsheetSymbol1),
              ),
              Padding(
                padding: EdgeInsets.only(left: w * 0.02),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: w*0.7,
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: AppColors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      "Added to cart",
                      style: TextStyle(
                        color: AppColors.lightGreen,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: h * 0.05),
          SizedBox(
            height: h * 0.06,
            width: w,
            child: OutlinedButton(
                onPressed: () {
                  Get.back();
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  foregroundColor: AppColors.black,
                  backgroundColor: AppColors.white,
                ),
                child: Text(
                  'COntinue Shopping',
                )),
          ),
          SizedBox(height: h * 0.02),
          SizedBox(
            height: h * 0.06,
            width: w,
            child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(AppPages.dashboard);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  foregroundColor: AppColors.white,
                  backgroundColor: AppColors.black,
                ),
                child: Text(
                  'view Cart',
                )),
          ),
        ],
      ),
    );
  }
}
