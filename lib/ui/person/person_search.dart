// import 'package:flutter/material.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:get/get.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:virualapi/constants/constant.dart';
// import 'package:virualapi/widgets/text_field.dart';
// import 'person_search_controller.dart';


// class PersonSearch extends StatelessWidget {
//   const PersonSearch({super.key});

//   @override

//    void _openSearchBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true, // This is necessary for controlling the height
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (BuildContext context) {
//         return Container(
//           height:
//               MediaQuery.of(context).size.height / 1.2, // Half screen height
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text(
//                 "Search",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               AppTextField(
//                 name: 'username',
//                 showTitle: false,
//                 title: "Username",
//                 rectangleborder: true,
//                 placeholder: "Enter First Name",
//                 validator: FormBuilderValidators.compose(([
//                   FormBuilderValidators.required(),
//                 ])),
//               ),
//               const SizedBox(height: 16),
//               AppTextField(
//                 name: 'username',
//                 showTitle: false,
//                 title: "Username",
//                 rectangleborder: true,
//                 placeholder: "Enter Last Name",
//                 validator: FormBuilderValidators.compose(([
//                   FormBuilderValidators.required(),
//                 ])),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: COLOR_PRIMARY,
//                     minimumSize: Size.fromHeight(50),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10))),
//                 onPressed: () {
//                   // Implement search logic here
//                   // Navigator.pop(context);
//                 },
//                 child: const Text("Search"),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget build(BuildContext context) {
//     return Container();
//   }
// }