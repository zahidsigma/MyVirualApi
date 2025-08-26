// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:virualapi/constants/constant.dart';
// import 'package:virualapi/ui/ConfirmScreen/confirm_screen.dart';
// import 'package:virualapi/ui/profile/profile_controller.dart';

// class CompareScreen extends StatelessWidget {
//   final List<Map<String, dynamic>>? selectedItems;
//   final int? totalPrice;
//   final String? tahoeId;
//   final RxString? useremail;

//   CompareScreen(
//       {this.selectedItems, this.totalPrice, this.tahoeId, this.useremail});

//   final ProfileController controller = Get.find<ProfileController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Compare Indicators'),
//         backgroundColor: COLOR_PRIMARY,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Display selected items (unchanged)
//             Expanded(
//               child: Card(
//                 margin: EdgeInsets.all(8),
//                 child: Padding(
//                   padding: EdgeInsets.all(16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Selected Indicators (${selectedItems!.length})',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 12),
//                       Divider(),
//                       Expanded(
//                         child: ListView.builder(
//                           itemCount: selectedItems!.length,
//                           itemBuilder: (context, index) {
//                             final item = selectedItems![index];
//                             return Padding(
//                               padding: EdgeInsets.symmetric(vertical: 8),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         item['label'],
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                       Text(
//                                         '${item['count']} records',
//                                         style: TextStyle(
//                                           fontSize: 12,
//                                           color: Colors.grey[600],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Text(
//                                     '\$${item['price']}',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.green,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       Divider(),
//                       Padding(
//                         padding: EdgeInsets.only(top: 8),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Total:',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               '\$$totalPrice',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.green,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),

//             // Add space before the button
//             SizedBox(height: 20),

//             // Button to navigate to ConfirmScreen
//             ElevatedButton(
//               onPressed: () {
//                 print("ComparScreen::: $tahoeId");
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ConfirmScreen(
//                         selectedItems: selectedItems,
//                         totalPrice: totalPrice,
//                         useremail: controller.email,
//                         tahoeId: tahoeId),
//                   ),
//                 );
//               },
//               child: Text('Confirm and Send'),
//               style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15)),
//                 minimumSize: Size(double.infinity, 50),
//                 backgroundColor: COLOR_PRIMARY,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:virualapi/constants/constant.dart';
// import 'package:virualapi/ui/ConfirmScreen/confirm_screen.dart';
// import 'package:virualapi/ui/profile/profile_controller.dart';

// class CompareScreen extends StatelessWidget {
//   final List<Map<String, dynamic>>? selectedItems;
//   final int? totalPrice;
//   final String? tahoeId;
//   final String? address;
//   final String? email;
//   final String? firstname;
//   final String? lastname;
//   final String? age;
//   final String? dob;
//   final bool socialMedia;
//   final bool comprehensiveReport;

//   CompareScreen(
//       {this.selectedItems,
//       this.totalPrice,
//       this.tahoeId,
//       this.address,
//       this.age,
//       this.dob,
//       this.email,
//       this.socialMedia = false,
//       this.comprehensiveReport = false,
//       this.firstname,
//       this.lastname});

//   final ProfileController controller = Get.find<ProfileController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Compare Indicators'),
//         backgroundColor: COLOR_PRIMARY,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: Card(
//                 margin: EdgeInsets.all(8),
//                 child: Padding(
//                   padding: EdgeInsets.all(16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Selected Indicators (${selectedItems?.length ?? 0})',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 12),
//                       Divider(),
//                       Expanded(
//                         child: ListView.builder(
//                           itemCount: selectedItems?.length ?? 0,
//                           itemBuilder: (context, index) {
//                             final item = selectedItems![index];
//                             return Padding(
//                               padding: EdgeInsets.symmetric(vertical: 8),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         item['label'],
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                       Text(
//                                         '${item['count']} records',
//                                         style: TextStyle(
//                                           fontSize: 12,
//                                           color: Colors.grey[600],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Text(
//                                     '\$${item['price']}',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.green,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       Divider(),
//                       Padding(
//                         padding: EdgeInsets.only(top: 8),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Total:',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               '\$$totalPrice',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.green,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 print("CompareScreen::: $tahoeId");

//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ConfirmScreen(
//                       selectedItems: selectedItems,
//                       totalPrice: totalPrice,
//                       useremail: controller.email.value, // RxString
//                       tahoeId: tahoeId,
//                       email: email,
//                       age: age,
//                       dob: dob,
//                       firstname: firstname,
//                       lastname: lastname,
//                       address: address,
//                     ),
//                   ),
//                 );
//               },
//               child: Text('Confirm and Send'),
//               style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15)),
//                 minimumSize: Size(double.infinity, 50),
//                 backgroundColor: COLOR_PRIMARY,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/ui/ConfirmScreen/confirm_screen.dart';
import 'package:virualapi/ui/profile/profile_controller.dart';

class CompareScreen extends StatelessWidget {
  final List<Map<String, dynamic>>? selectedItems;
  final int? totalPrice;
  final String? tahoeId;
  final String? address;
  final String? email;
  final String? firstname;
  final String? lastname;
  final String? age;
  final String? dob;
  final bool socialMedia;
  final bool comprehensiveReport;

  CompareScreen({
    this.selectedItems,
    this.totalPrice,
    this.tahoeId,
    this.address,
    this.email,
    this.firstname,
    this.lastname,
    this.age,
    this.dob,
    this.socialMedia = false,
    this.comprehensiveReport = false,
  });

  // Keys of the special reports to exclude from UI
  static const Set<String> specialReportKeys = {
    'haComprehensiveReport',
    'haSocialMediaReport',
  };

  @override
  Widget build(BuildContext context) {
    // Filter selectedItems to exclude special reports for UI display
    final displayItems = selectedItems
            ?.where((item) => !specialReportKeys.contains(item['key']))
            .toList() ??
        [];

    final ProfileController controller = Get.find<ProfileController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Compare Indicators'),
        backgroundColor: COLOR_PRIMARY,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Card(
                margin: EdgeInsets.all(8),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selected Indicators (${displayItems.length})',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Divider(),
                      Expanded(
                        child: ListView.builder(
                          itemCount: displayItems.length,
                          itemBuilder: (context, index) {
                            final item = displayItems[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['label'] ?? '',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        '${item['count']} records',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '\$${item['price']}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$$totalPrice',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Use the flags and selectedItems including special reports
                print('Social Media Included? $socialMedia');
                print('Comprehensive Report Included? $comprehensiveReport');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmScreen(
                      selectedItems: selectedItems,
                      totalPrice: totalPrice,
                      useremail: controller.email.value, // RxString
                      tahoeId: tahoeId,
                      email: email,
                      age: age,
                      dob: dob,
                      firstname: firstname,
                      lastname: lastname,
                      address: address,
                      // social_media_report: socialMedia == true ? 1 : 0,
                      // comprehensive_report: comprehensiveReport == true ? 1 : 0,
                    ),
                  ),
                );
              },
              child: Text('Confirm and Send'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                minimumSize: Size(double.infinity, 50),
                backgroundColor: COLOR_PRIMARY,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
