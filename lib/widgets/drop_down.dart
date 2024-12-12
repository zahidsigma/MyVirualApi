import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AppDropdown extends StatelessWidget {
  final String name;
  final String placeholder;
  final List<DropdownMenuItem<dynamic>> items;
  final double width;
  final TextStyle? placeholderStyle;
  final String? Function(dynamic?)? validator;
  const AppDropdown(
      {super.key,
      required this.name,
      required this.placeholder,
      required this.items,
      required this.width,
      this.validator,
      this.placeholderStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        child: FormBuilderDropdown(
          name: name,
          validator: validator,
          isExpanded: true,
          decoration: InputDecoration(
              hintText: placeholder, hintStyle: placeholderStyle),
          items: items,
        ));
  }
}
