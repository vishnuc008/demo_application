import 'package:demo_application/Demo_App/presentation/themes/app_assets.dart';
import 'package:demo_application/Demo_App/presentation/themes/app_colors.dart';
import 'package:demo_application/Demo_App/presentation/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: w * 0.02, top: h * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(""),
                  Container(
                    width: w * 0.1,
                    decoration: BoxDecoration(
                        color: AppColors.grey, shape: BoxShape.circle),
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.close),
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h * 0.04,
            ),
            Container(
              height: h * 0.25,
              width: w * 0.5,
              child: Image(
                image: AssetImage(AppAssets.splashwatch),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: h * 0.08,
            ),
            Container(
              height: h * 0.08,
              width: w * 0.5,
              child: Image(
                image: AssetImage(AppAssets.demo),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: h * 0.04,
            ),
            Text(
              "Get start your new shopping experience",
              style: TextStyle(
                  fontFamily: "Plus Jakarta Sans",
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: h * 0.06,
            ),
            CustomGradientButton(
              onPressed: () {},
              title: "Continue via Phone",
              prefix: Icon(Icons.smartphone_outlined,color: AppColors.white,),
              suffix: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward_rounded),
                color: AppColors.white,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(w * 0.03, h * 0.03, w * 0.03, h * 0.07),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: h * 0.07,
                      width: w * 0.09,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.black)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: h * 0.04,
                            width: w * 0.085,
                            child: Image(
                              image: AssetImage(AppAssets.google),
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: w * 0.02,
                          ),
                          Text(
                            "Login with Google",
                            style: TextStyle(
                                fontFamily: "Plus Jakarta Sans",
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: w * 0.03,
                  ),
                  Expanded(
                    child: Container(
                      height: h * 0.07,
                      width: w * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.black)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: h * 0.04,
                            width: w * 0.085,
                            child: Image(
                              image: AssetImage(AppAssets.apple),
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: w * 0.02,
                          ),
                          Text(
                            "Login with Apple ID",
                            style: TextStyle(
                                fontFamily: "Plus Jakarta Sans",
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            Padding(
              padding:  EdgeInsets.only(left: w*0.02,right: w*0.02),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "By Continuing you are Accept to our",
                    style: TextStyle(
                        fontFamily: "Plus Jakarta Sans",
                        color: AppColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
                        
                TextSpan(text: " T&C ",style: TextStyle(
                
                        color: AppColors.red,
                        fontFamily: "Plus Jakarta Sans",
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
                        TextSpan(
                    text: "and ",
                    style: TextStyle(
                        fontFamily: "Plus Jakarta Sans",
                       
                        fontSize: 14,
                        color: AppColors.black,
                        fontWeight: FontWeight.w400)),
                        TextSpan(
                    text: "Privacy policy",
                    style: TextStyle(
                        fontFamily: "Plus Jakarta Sans",
                        color: AppColors.red,
                        fontSize: 14,
                        
                        fontWeight: FontWeight.w400)),
              ])),
            )
          ],
        ),
      ),
    ));
  }
}
