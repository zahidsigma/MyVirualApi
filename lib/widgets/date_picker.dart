import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class DateTimePicker extends StatelessWidget {
  final String placeholder;
  final bool showTitle;
  final String? title;
  final DateTime minDate;
  final DateTime maxDate;
  final String name;
  final Function(DateTime?)? onDateSelected;
  final String? Function(DateTime?)? validator;
  final InputType inputType;

  const DateTimePicker({
    super.key,
    required this.placeholder,
    this.title,
    required this.minDate,
    required this.maxDate,
    this.onDateSelected,
    required this.name,
    required this.validator,
    this.showTitle = true,
    this.inputType = InputType.date,
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
        FormBuilderDateTimePicker(
          inputType: inputType,
          format: DateFormat("d-MM-yyyy"),
          validator: validator,
          decoration: InputDecoration(hintText: placeholder),
          onChanged: onDateSelected,
          name: name,
          initialDate: DateTime.now(),
          firstDate: minDate,
          lastDate: maxDate,
        ),
      ],
    );
  }
}

// class DatePicker extends StatefulWidget {


//   const DatePicker({
//     super.key,
   
//   });

//   @override
//   State<DatePicker> createState() => _DatePickerState();
// }

// class _DatePickerState extends State<DatePicker> {
//   _handleTap() async {
//     var date = await showDatePicker(
//         context: context,
//         initialDate: widget.date,
//         firstDate: widget.minDate,
//         lastDate: widget.maxDate);
//     date != null ? widget.onDateSelected(date) : null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FormBuilderDateTimePicker(
//       name: widget.name,
//       initialDate: ,
//     );
    
//     // GestureDetector(
//     //   onTap: _handleTap,
//     //   child: Column(
//     //     crossAxisAlignment: CrossAxisAlignment.start,
//     //     children: [
//     //       widget.showTitle
//     //           ? Text(
//     //               widget.title ?? widget.placeholder,
//     //               style: TextStyle(
//     //                   fontWeight: FontWeight.bold, fontFamily: 'Poppinsb'),
//     //             )
//     //           : SizedBox(),
//     //       Container(
//     //         width: getScreenWidth(context) * 0.8,
//     //         padding: EdgeInsets.only(bottom: 10, top: 10),
//     //         decoration: BoxDecoration(
//     //             border: Border(
//     //                 bottom: BorderSide(color: Colors.black38, width: 1))),
//     //         child: Text(widget.placeholder),
//     //       )
//     //     ],
//     //   ),
//     // );
//   }
// }
