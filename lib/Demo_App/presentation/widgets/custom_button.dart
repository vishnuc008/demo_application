import 'package:demo_application/Demo_App/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomGradientButton extends StatelessWidget {
  const CustomGradientButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.buttonTColor,
    this.buttonBColor,
    this.textColor,
    this.width,
    this.height, this.prefix, this.suffix,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;
  final Color? buttonTColor;
  final Color? buttonBColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final Widget? prefix;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    return SizedBox(
      width: width ?? w * 0.9,
      height: height ?? h * 0.068,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.black,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.all(0),

        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: ListTile(
            leading: prefix,
           
            title: Text(title,style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 16.0,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w500,
            ),),
            trailing: suffix,
            
          ),
        ),
      ),
    );
  }
}

class CustomGradientLoadingButton extends StatelessWidget {
  const CustomGradientLoadingButton({
    Key? key,
    this.buttonTColor,
    this.buttonBColor,
    this.textColor,
    this.width,
    this.height,
  }) : super(key: key);

  final Color? buttonTColor;
  final Color? buttonBColor;
  final Color? textColor;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    return SizedBox(
      width: width ?? w * 0.8,
      height: height ?? h * 0.06,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.all(0),
        ),
        onPressed: () {},
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                // buttonTColor ?? const Color(0xFFFF0000),
                buttonTColor ?? Theme.of(context).primaryColor,
                // buttonBColor ?? const Color(0xFFF95C3A)
                buttonBColor ?? Theme.of(context).primaryColorLight
              ],
            ),
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: LoadingAnimationWidget.threeArchedCircle(
              color: Colors.white,
              size: h * 0.04,
            ),
          ),
        ),
      ),
    );
  }
}
