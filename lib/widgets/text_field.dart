import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AppTextField extends StatefulWidget {
  final String placeholder;
  final String? title;
  final TextEditingController? controller;
  final bool obsecureText;
  final Image? image;
  final Widget? icon;
  final String? Function(String?)? validator;
  final String name;
  final bool showTitle;
  final TextInputType inputType;
  final int maxLength;
  final int maxline;
  final FocusNode? focusNode;
  final double fontSize;
  final List<TextInputFormatter> formatters;
  final VoidCallback? onCompleted;
  final bool? enabled;
  final bool? rectangleborder;
  const AppTextField(
      {super.key,
      required this.placeholder,
      this.inputType = TextInputType.text,
      this.maxLength = 10000,
      this.showTitle = true,
      this.name = "",
      this.title,
      this.maxline = 1,
      this.controller,
      this.image,
      this.icon,
      this.validator,
      this.focusNode,
      this.fontSize = 14,
      this.formatters = const [],
      this.onCompleted,
      this.obsecureText = false,
      this.rectangleborder = false,
      this.enabled = true});

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.showTitle
            ? Text(
                widget.title ?? widget.placeholder,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppinsb',
                ),
              )
            : SizedBox(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: widget.rectangleborder == false
                ? Color(0xffEBEFEF)
                : Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: FormBuilderTextField(
            name: widget.name,
            controller: widget.controller,
            expands: false,
            maxLines: widget.maxline,
            validator: widget.validator,
            obscureText: widget.obsecureText,
            keyboardType: widget.inputType,

            focusNode: widget.focusNode,
            maxLength: widget.maxLength,
            inputFormatters: widget.formatters,
            enabled: widget.enabled ?? true,

            style: TextStyle(fontSize: widget.fontSize),
            onEditingComplete: () {
              FocusManager.instance.primaryFocus?.unfocus();
              widget.onCompleted?.call();
            },
            //Dimiss keyboard widget.onCompleted,
            decoration: InputDecoration(
                counterText: "",
                hintText: widget.placeholder,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 17),
                border: widget.rectangleborder == true
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))
                    : InputBorder.none,
                suffixIcon: widget.icon),
          ),
        ),
      ],
    );
  }
}
