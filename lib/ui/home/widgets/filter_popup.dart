// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:get/get.dart';
// import 'package:cash_panda/constants/constant.dart';
// import 'package:cash_panda/core/routing/router_str.dart';
// import 'package:cash_panda/ui/home/home_controller.dart';
// import 'package:cash_panda/widgets/button.dart';
// import 'package:cash_panda/widgets/misc_widget.dart';
// import 'package:cash_panda/widgets/radio_group.dart';
// import 'package:dropdown_search/dropdown_search.dart';

// class FilterPopup extends StatefulWidget {
//   FilterPopup({super.key});
//   @override
//   State<FilterPopup> createState() => _FilterPopupState();
// }

// class _FilterPopupState extends State<FilterPopup> {
//   final formBuilderKey = GlobalKey<FormBuilderState>();
//   final homeController = Get.find<HomeController>();
//   List<String> keywords = [];

//   _apply() {
//     print("apply");
//     if (formBuilderKey.currentState!.saveAndValidate()) {
//       var gender = formBuilderKey.currentState!.value['gender'];
//       print(gender);
//       Navigator.pop(context);
//       Get.toNamed(Routers.doctors, parameters: {
//         "keywords": keywords.join(', '),
//         "gender": gender == 'All' ? "" : gender
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: SingleChildScrollView(
//       child: Container(
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10), color: Colors.white),
//           margin: EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               Align(
//                 alignment: Alignment.topRight,
//                 child: IconButton(
//                     onPressed: () => Navigator.of(context).pop(),
//                     icon: Icon(Icons.close, color: COLOR_ACCENT)),
//               ),
//               FormBuilder(
//                 key: formBuilderKey,
//                 initialValue: {'gender': 'All'},
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   child: Column(
//                     children: [
//                       Text(
//                         'Advanced Filter',
//                         style: TextStyle(fontSize: 18.0),
//                       ),
//                       AppSpacerH(15),
//                       DropdownSearch<String>.multiSelection(
//                         items: homeController.keywords,
//                         popupProps: PopupPropsMultiSelection.menu(
//                             showSearchBox: true,
//                             showSelectedItems: true,
//                             searchDelay: Duration(milliseconds: 50),
//                             searchFieldProps: TextFieldProps(
//                                 decoration: InputDecoration(
//                                     focusedBorder: OutlineInputBorder(
//                                         borderSide:
//                                             BorderSide(color: COLOR_PRIMARY)),
//                                     hintText:
//                                         'Type your condition and select from the list'))
//                             // disabledItemFn: (String s) => s.startsWith('I'),
//                             ),
//                         onChanged: (value) {
//                           setState(() {
//                             keywords = value;
//                           });
//                         },
//                         selectedItems: keywords,
//                       ),
//                       AppSpacerH(20),
//                       RadioGroup(
//                           name: 'gender',
//                           placeholder: "Gender",
//                           showTitle: true,
//                           title: "Gender",
//                           validator: FormBuilderValidators.compose(
//                             [
//                               FormBuilderValidators.required(),
//                             ],
//                           ),
//                           initialValue: "All",
//                           options: [
//                             FormBuilderFieldOption(value: "All"),
//                             FormBuilderFieldOption(value: "Male"),
//                             FormBuilderFieldOption(value: "Female"),
//                           ]),
//                       AppSpacerH(16),
//                       Button(
//                         // isLoading: controller.isBusy.value,
//                         height: 45,
//                         title: "Apply",
//                         onPressed: _apply,
//                         backgroundColor: Color(0xFFEB8F07),
//                       ),
//                       AppSpacerH(16),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           )),
//     ));
//   }
// }
