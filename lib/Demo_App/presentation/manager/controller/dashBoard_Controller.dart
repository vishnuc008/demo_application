import 'package:demo_application/Demo_App/domain/entities/order_modal.dart';
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

  removeFromcart(ProductResponseModal modal, int quantity, subTotal) {
    CartModal cartModal = CartModal(modal, quantity, subTotal);

    int existingIndex = cartList.indexWhere((element) =>
        element.productResponseModal == cartModal.productResponseModal);
    if (existingIndex != -1) {
      CartModal existingCartModal = cartList[existingIndex];
      cartList.remove(existingCartModal);
      if (quantity > 0) {
        existingCartModal = CartModal(
          modal,
          existingCartModal.quantity - 1,
          subTotal,
        );

        cartList.add(existingCartModal);
      } else if (quantity == 0) {
        cartList.remove(existingCartModal);
      } else {
        existingCartModal = CartModal(
          modal,
          existingCartModal.quantity - 1,
          subTotal,
        );

        cartList.add(existingCartModal);
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
  }

  var total = 0.0;
  var totalPay = 0.0;
  final isTotalLoading = false.obs;
  getTotal(List<CartModal> list) {
    isTotalLoading.value = true;
    total = 0.0;
    totalPay = 0.0;
    for (var i in list) {
      total = total + i.subtotal;
    }
    totalPay = total + 200;
    isTotalLoading.value = false;
  }

  double subtotalcalculation(double subtotal, int quantitiy) {
    return subtotal * quantitiy.toDouble();
  }

  final isRemoveCart = false.obs;
  deletefromcart(CartModal modal) {
    isRemoveCart.value = true;
    cartList.remove(modal);
    cartList.refresh();
    getTotal(cartList);
    isRemoveCart.value = false;
  }

  final orderList = <OrderModal>[];
  final addToOrderLoading = false.obs;
  addToOrder(List<CartModal> orderModalList) {
    customPrint("addTo order started");
    addToOrderLoading.value = true;
    for (var i in orderModalList) {
      customPrint("addTo order entered in for");
      orderList.add(OrderModal(i, DateTime.now()));
    }

    cartList.clear();
    customPrint("addTo order Success");
    addToOrderLoading.value = false;
    Get.bottomSheet(
      OrderBottomSheet(),
    );
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
                      width: w * 0.7,
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
                  Get.back();
                  
                  Get.toNamed(AppPages.myCartPage);
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

class OrderBottomSheet extends StatelessWidget {
  OrderBottomSheet({super.key});
  final dashboardController = Get.find<DashboardController>();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      height: h * 0.35,
      color: AppColors.white,
      width: w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(""),
              Padding(
                padding: EdgeInsets.only(right: w * 0.02),
                child: Container(
                  width: w * 0.1,
                  decoration: const BoxDecoration(
                      color: AppColors.grey, shape: BoxShape.circle),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: h * 0.00),
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
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
            child: Image(
              image: AssetImage(AppAssets.mark),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: h * 0.025,
          ),
          Text("Your Order Was Successfully Placed",
              style: TextStyle(
                  fontFamily: "Plus Jakarta Sans",
                  fontSize: 16,
                  color: AppColors.black,
                  fontWeight: FontWeight.w600)),
          Text("You’ll receive an email at  elisha2018@gmail.com once ",
              style: TextStyle(
                  fontFamily: "Plus Jakarta Sans",
                  fontSize: 10,
                  color: AppColors.black,
                  fontWeight: FontWeight.w400)),
          Text("your order is confirmed",
              style: TextStyle(
                  fontFamily: "Plus Jakarta Sans",
                  fontSize: 10,
                  color: AppColors.black,
                  fontWeight: FontWeight.w400)),
          SizedBox(
            height: h * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      dashboardController.getproducts();
                      Get.toNamed(AppPages.dashboard);
                    },
                    child: Container(
                      height: h * 0.05,
                      width: w * 0.09,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.black)),
                      child: Center(
                        child: const Text(
                          "Continue Shopping",
                          style: TextStyle(
                              fontFamily: "Plus Jakarta Sans",
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: w * 0.03,
                ),
                Expanded(
                  child: SizedBox(
                    height: h * 0.05,
                    width: w * 0.9,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.black),
                        onPressed: () {
                          Get.toNamed(AppPages.orderPage);
                        },
                        child: Text(
                          "View Order",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
