import 'package:demo_application/Demo_App/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';


class LabelCustomTextField extends StatefulWidget {
  const LabelCustomTextField({
    super.key,
    required this.hintText,
    this.onPressed,
    this.onchanged,
    this.passwordfield,
    this.showSuffixicon,
    this.controller,
    this.inputFormatters,
    this.suffix,
    this.validator,
    this.inputType,
    this.lines,
    this.onTap,
    this.readOnly,
    this.prefix,
    this.label,
    this.labelText,
    this.enable,
    this.autofillHints,
    required this.textFieldLabel,
    this.focusNode,
    this.onFieldSubmitted,
    this.nextFocusNode,
    this.textInputAction,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final bool? showSuffixicon;
  final bool? enable;
  final Function? onPressed;
  final Function? onTap;
  final Function? onchanged;
  final bool? passwordfield;
  final Widget? suffix;
  final Function(String)? validator;
  final TextInputType? inputType;
  final int? lines;
  final Widget? prefix;
  final bool? readOnly;
  final Widget? label;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  final String textFieldLabel;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final FocusNode? nextFocusNode;
  final TextInputAction? textInputAction;

  @override
  State<LabelCustomTextField> createState() => _LabelCustomTextField();
}

class _LabelCustomTextField extends State<LabelCustomTextField> {
  bool showpassword = true;
  late bool showPrefixIcon;

  bool isDeviceTab = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      deviceCheck();
    });
    showPrefixIcon = widget.showSuffixicon ?? false;

    super.initState();
  }

  deviceCheck() {
    if (MediaQuery.of(context).size.width > 600) {
      isDeviceTab = true;
    } else {
      isDeviceTab = false;
    }
    //customPrint("device is Tab in collection page=$isDeviceTab");
  }

  @override
  @override
  Widget build(BuildContext context) {
     final h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    final o = MediaQuery.of(context).orientation;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.textFieldLabel,
          style: TextStyle(
              color: AppColors.black,
              fontSize: o == Orientation.landscape ? w * 0.018 : w * 0.035,
              fontFamily: "Poppins"),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
             shape: BoxShape.rectangle,
            boxShadow: [
              // BoxShadow(
              //   color: Colors.black.withOpacity(0.1),
              //   spreadRadius: 1,
              //   blurRadius: 6,
              //   offset: const Offset(0, 6),
              // ),
            ],
          ),
          
          width: w,
          child: TextFormField(
            
            onFieldSubmitted: (term) {
              if (widget.nextFocusNode != null) {
                FocusScope.of(context).requestFocus(widget.nextFocusNode);
              } else if (widget.onTap != null) {
                widget.onTap!();
              }
            },
            textInputAction: widget.textInputAction ?? TextInputAction.done,
            focusNode: widget.focusNode,
            autofillHints: widget.autofillHints,
            inputFormatters: widget.inputFormatters,
            onChanged: (value) {
              if (widget.onchanged != null) {
                widget.onchanged!(value);
              }
            },
            controller: widget.controller,
            validator: widget.validator == null
                ? null
                : (val) => widget.validator!(val ?? ""),
            obscureText: widget.passwordfield == true ? showpassword : false,
            keyboardType: widget.inputType ?? TextInputType.text,
            maxLines: widget.passwordfield == true ? 1 : widget.lines,
            decoration: InputDecoration(
                filled: true,
                label: widget.label,
                labelText: widget.labelText,
                labelStyle: const TextStyle(),
                fillColor: AppColors.white,
                prefixIcon: showPrefixIcon ? widget.prefix : null,
                suffixIcon: widget.passwordfield == true
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            showpassword = !showpassword;
                          });
                        },
                        icon: showpassword
                            ? Icon(
                                Ionicons.eye_off,
                                size: 20,
                                color: Theme.of(context).primaryColor,
                              )
                            : Icon(
                                Icons.remove_red_eye,
                                color: Theme.of(context).primaryColor,
                              ))
                    : widget.suffix,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                  color: AppColors.greyText,
                  width: 0.3,
                )),
                hintText: widget.hintText,
                focusedBorder: OutlineInputBorder(
                  borderRadius:  BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 0.3,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius:  BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                  color: AppColors.greyText,
                  width: 0.3,
                )),
                disabledBorder: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                hintStyle: const TextStyle(
                  color: Colors.grey,
                )),
          ),
        ),
      ],
    );
  }
}
