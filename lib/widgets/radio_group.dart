import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:virualapi/constants/constant.dart';

class RadioGroup extends StatelessWidget {
  final String placeholder;
  final String name;
  final bool showTitle;
  final String? title;
  final dynamic initialValue;
  final Color color;
  final List<FormBuilderFieldOption> options;
  final String? Function(dynamic)? validator;

  const RadioGroup({
    super.key,
    required this.name,
    required this.placeholder,
    required this.showTitle,
    required this.title,
    required this.validator,
    required this.options,
    this.initialValue,
    this.color = COLOR_PRIMARY,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        showTitle
            ? Text(
                title ?? placeholder,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'Poppinsb'),
              )
            : SizedBox(),
        FormBuilderRadioGroup(
          validator: validator,
          name: name,
          options: options,
          activeColor: COLOR_PRIMARY,
        )
      ],
    );
  }
}
