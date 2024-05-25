import 'package:demo_application/Demo_App/domain/entities/cart_dummy_modal.dart';
import 'package:demo_application/Demo_App/domain/entities/cart_modal.dart';
import 'package:demo_application/Demo_App/presentation/manager/bindings/cart_controller_bindings.dart';
import 'package:demo_application/Demo_App/presentation/manager/controller/cart_controller.dart';
import 'package:demo_application/Demo_App/presentation/themes/app_assets.dart';
import 'package:demo_application/Demo_App/presentation/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  final cartController= Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: cartController.cartlist.length,
    itemBuilder: (context, index) {
    return CartItem(modal: cartController.cartlist[index]);
    },);
  }
}
class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.modal});
final CartDummyModal modal;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: h*0.16,      
        width: w,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 248, 245, 245)
        ),
        child: Row(
          children: [
            Container(
              height: h*0.16,
              width: w*0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10)),
                color: AppColors.cardcolor
              ),
              child: Image(image: AssetImage(modal.img),height: h*0.07,),
            ),
            SizedBox(width: w*0.03,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: h*0.01),
              Text(modal.productName, style: TextStyle(
                              fontFamily: "Plus Jakarta Sans",
                              fontSize: 14,
                              color: AppColors.black,
                              fontWeight: FontWeight.w600)),
                                
              Text(modal.productColor, style: TextStyle(
                              fontFamily: "Plus Jakarta Sans",
                              fontSize: 14,
                              color: AppColors.black,
                              fontWeight: FontWeight.w600)),
                                SizedBox(height: h*0.01),
              Text(modal.amount, style: TextStyle(
                              fontFamily: "Plus Jakarta Sans",
                              fontSize: 12,
                              color: AppColors.black,
                              fontWeight: FontWeight.w600)),
                
              Row(
                children: [
                  Container(
                    width: w*0.07,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      shape: BoxShape.circle
                    ),
                    child: Padding(
                      padding:  EdgeInsets.only(bottom: h*0.01),
                      child: IconButton(onPressed: (){},
                       icon: Icon(Icons.minimize_outlined),
                       iconSize: 14,
                       color: AppColors.white,),
                    ),
                  ),
                  SizedBox(width: w*0.02,),
                  Text(modal.cartNo,style: TextStyle(
                              fontFamily: "Plus Jakarta Sans",
                              fontSize: 14,
                              color: AppColors.black,
                              fontWeight: FontWeight.w600)),
                                 SizedBox(width: w*0.02,),
                  Container(
                    width: w*0.07,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      shape: BoxShape.circle
                    ),
                    child: IconButton(onPressed: (){},
                     icon: Icon(Icons.add),color: AppColors.white,
                     iconSize: 14,),
                  ),
                ],
              )
              ],
            ),
            Padding(
              padding:  EdgeInsets.fromLTRB(w*0.09, 0, w*0.01, h*0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(""),
                   Container(
                      height: h*0.04,
                      
                      child: Image(image: AssetImage(AppAssets.delete),fit: BoxFit.cover,)
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