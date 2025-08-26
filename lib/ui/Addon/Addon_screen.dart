// import 'package:flutter/material.dart';
// import 'package:virualapi/constants/constant.dart';
// import 'package:virualapi/ui/compare/compare_screen.dart';

// class AddonScreen extends StatefulWidget {
//   final Map<String, int>? indicators;
//   final String? tahoeId;
//   final String? address;
//   final String? email;
//   final String? firstname;
//   final String? lastname;
//   final String? age;
//   final String? dob;
//   final String? gender;

//   AddonScreen(
//       {this.indicators,
//       this.tahoeId,
//       this.address,
//       this.age,
//       this.dob,
//       this.gender,
//       this.email,
//       this.firstname,
//       this.lastname});

//   @override
//   _AddonScreenState createState() => _AddonScreenState();
// }

// class _AddonScreenState extends State<AddonScreen> {
//   late Map<String, bool> selectedIndicators;

//   // Fields with labels for better UI display
//   // final List<Map<String, String>> fields = [
//   //   {"key": "hasBankruptcyRecords", "label": "Bankruptcy Records"},
//   //   {"key": "hasEvictionsRecords", "label": "Evictions Records"},
//   //   //  {"key": "hasEvictionsRecords", "label": "Evictions Records"},
//   //   {"key": "hasUnbankedData", "label": "Unbanked Data"},
//   //   {"key": "hasMobilePhones", "label": "Mobile Phones"},
//   //   {"key": "hasLandLines", "label": "Land Lines"},
//   //   {"key": "hasEmails", "label": "Emails"},
//   //   {"key": "hasAddresses", "label": "Addresses"},
//   //   {"key": "hasCurrentAddresses", "label": "Current Addresses"},
//   //   {"key": "hasHistoricalAddresses", "label": "Historical Addresses"},
//   // ];
//   final List<Map<String, dynamic>> fields = [
//     // {"key": "hasBankruptcyRecords", "label": "Bankruptcy Records", "price": 7},
//     {"key": "hasBusinessRecords", "label": "Business Records", "price": 3},
//     {"key": "hasDivorceRecords", "label": "Divorce Records", "price": 5},
//     {"key": "hasDomainsRecords", "label": "Domains Records", "price": 2},
//     {"key": "hasEvictionsRecords", "label": "Evictions Records", "price": 9},
//     {"key": "hasFeinRecords", "label": "Fein Records", "price": 4},
//     {"key": "hasCriminalRecords", "label": "Criminal", "price": 7},
//     {
//       "key": "hasForeclosuresRecords",
//       "label": "Foreclosures Records",
//       "price": 6
//     },
//     // {"key": "hasJudgmentRecords", "label": "Judgment Records", "price": 1},
//     // {"key": "hasLienRecords", "label": "Lien Records", "price": 8},
//     {"key": "hasMarriageRecords", "label": "Marriage Records", "price": 10},
//     {
//       "key": "hasProfessionalLicenseRecords",
//       "label": "Professional License Records",
//       "price": 3
//     },
//     {"key": "hasPropertyRecords", "label": "Property Records", "price": 7},
//     // {
//     //   "key": "hasVehicleRegistrationsRecords",
//     //   "label": "Vehicle Registrations Records",
//     //   "price": 5
//     // },
//     {"key": "hasWorkplaceRecords", "label": "Workplace Records", "price": 2},
//     {"key": "hasDeaRecords", "label": "DEA Records", "price": 6},
//     {"key": "hasDebtRecords", "label": "Debt Records", "price": 6},
//   ];
//   @override
//   void initState() {
//     super.initState();
//     // selectedIndicators = {
//     //   for (var entry in widget.indicators.entries)
//     //     if (entry.value > 0) entry.key: false, // Only show non-zero indicators
//     // };print(`$widget,email,widget klasname`);

//     print(
//         'object: Email :${widget.email}, LastName ${widget.lastname},${widget.firstname}, ${widget.tahoeId}, ${widget.address},Age: ${widget.age},Dob: ${widget.dob},Gender: ${widget.gender}');

//     selectedIndicators = {
//       for (var entry in widget.indicators!.entries)
//         if (entry.value > 0 && fields.any((field) => field["key"] == entry.key))
//           entry.key: false,
//     };
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Full Report"),
//         backgroundColor: COLOR_PRIMARY,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: selectedIndicators.isEmpty
//                   ? Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.warning, size: 48, color: Colors.orange),
//                           SizedBox(height: 16),
//                           Text(
//                             'No Records found',
//                             style: TextStyle(fontSize: 18),
//                           ),
//                           SizedBox(height: 8),
//                           Text(
//                             'This User Have No  Found',
//                             style: TextStyle(color: Colors.grey),
//                           ),
//                         ],
//                       ),
//                     )
//                   : ListView(
//                       children: selectedIndicators.keys.map((key) {
//                         // Find the field or use default values
//                         final field = fields.firstWhere(
//                           (field) => field["key"] == key,
//                           orElse: () => {
//                             "key": key,
//                             "label": key,
//                             "price": 0,
//                           },
//                         );

//                         String label = field["label"]!;
//                         int price = field["price"] as int;
//                         bool isSelected = selectedIndicators[key] ?? false;

//                         return Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 4.0),
//                           child: Row(
//                             children: [
//                               Checkbox(
//                                 value: isSelected,
//                                 onChanged: (bool? value) {
//                                   setState(() {
//                                     selectedIndicators[key] = value ?? false;
//                                   });
//                                   print(selectedIndicators[key]);
//                                 },
//                                 activeColor: COLOR_PRIMARY,
//                                 checkColor: Colors.white,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(4),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Expanded(
//                                       child: Center(
//                                         child: Text(
//                                           "$label: ${widget.indicators![key]}",
//                                           style: TextStyle(
//                                             color: isSelected
//                                                 ? COLOR_PRIMARY
//                                                 : Colors.black,
//                                           ),
//                                           overflow: TextOverflow.ellipsis,
//                                         ),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding:
//                                           const EdgeInsets.only(right: 16.0),
//                                       child: Text(
//                                         "\$$price",
//                                         style: TextStyle(
//                                           color: isSelected
//                                               ? COLOR_PRIMARY
//                                               : Colors.black,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       }).toList(),
//                     ),
//             ),
//             if (selectedIndicators.isNotEmpty)
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: COLOR_PRIMARY,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15)),
//                   minimumSize: Size.fromHeight(50),
//                 ),
//                 onPressed: () {
//                   final selectedItems = selectedIndicators.entries
//                       .where((entry) => entry.value)
//                       .map((entry) {
//                     final field = fields.firstWhere(
//                       (f) => f["key"] == entry.key,
//                       orElse: () =>
//                           {"key": entry.key, "label": entry.key, "price": 0},
//                     );
//                     return {
//                       'label': field['label'],
//                       'price': field['price'],
//                       'count': widget.indicators![entry.key],
//                       'key': entry.key,
//                     };
//                   }).toList();
//                   print(selectedItems);

//                   if (selectedItems.isEmpty) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text('This User Have No  Record ')),
//                     );
//                     return;
//                   }

//                   final totalPrice = selectedItems.fold(
//                       0, (sum, item) => sum + (item['price'] as int));

//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => CompareScreen(
//                           selectedItems: selectedItems,
//                           totalPrice: totalPrice,
//                           firstname: widget.firstname,
//                           lastname: widget.lastname,
//                           age: widget.age,
//                           dob: widget.dob,
//                           email: widget.email,
//                           address: widget.address,
//                           tahoeId: widget.tahoeId),
//                     ),
//                   );
//                   // print(selectedItems);
//                 },
//                 child: Text("Generate Report"),
//               ),
//             if (selectedIndicators.isEmpty)
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: COLOR_PRIMARY,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15)),
//                   minimumSize: Size.fromHeight(50),
//                 ),
//                 onPressed: () {
//                   // Optionally navigate back or to another screen
//                   Navigator.pop(context);
//                 },
//                 child: Text("Go Back"),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:virualapi/constants/constant.dart';
// import 'package:virualapi/models/dynamic_price.dart';
// import 'package:virualapi/ui/compare/compare_screen.dart';
// import 'addon_controller.dart';

// class AddonScreen extends StatelessWidget {
//   final Map<String, int>? indicators;
//   final String? tahoeId;
//   final String? address;
//   final String? email;
//   final String? firstname;
//   final String? lastname;
//   final String? age;
//   final String? dob;
//   final String? gender;

//   AddonScreen({
//     this.indicators,
//     this.tahoeId,
//     this.address,
//     this.age,
//     this.dob,
//     this.gender,
//     this.email,
//     this.firstname,
//     this.lastname,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final AddonController controller =
//         Get.put(AddonController(indicators: indicators!));

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Full Report"),
//         backgroundColor: COLOR_PRIMARY,
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         if (controller.errorMessage.value != null) {
//           return Center(child: Text(controller.errorMessage.value!));
//         }

//         if (controller.selectedIndicators.isEmpty) {
//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 Icon(Icons.warning, size: 48, color: Colors.orange),
//                 SizedBox(height: 16),
//                 Text('No Records found', style: TextStyle(fontSize: 18)),
//                 SizedBox(height: 8),
//                 Text('This User Have No Found',
//                     style: TextStyle(color: Colors.grey)),
//               ],
//             ),
//           );
//         }

//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               Expanded(
//                 child: ListView(
//                   children: controller.selectedIndicators.keys.map((key) {
//                     final PricingType field = controller.fields.firstWhere(
//                       (field) => field.key == key,
//                       orElse: () => PricingType(
//                         label: key,
//                         key: key,
//                         price: 0,
//                         count: indicators![key] ?? 0,
//                       ),
//                     );

//                     final isSelected =
//                         controller.selectedIndicators[key] ?? false;

//                     return Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 4.0),
//                       child: Row(
//                         children: [
//                           Checkbox(
//                             value: isSelected,
//                             onChanged: (bool? value) {
//                               controller.toggleIndicator(key, value ?? false);
//                             },
//                             activeColor: COLOR_PRIMARY,
//                             checkColor: Colors.white,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(4),
//                             ),
//                           ),
//                           Expanded(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Expanded(
//                                   child: Center(
//                                     child: Text(
//                                       "${field.label}: ${indicators![key]}",
//                                       style: TextStyle(
//                                         color: isSelected
//                                             ? COLOR_PRIMARY
//                                             : Colors.black,
//                                       ),
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(right: 16.0),
//                                   child: Text(
//                                     "\$${field.price}",
//                                     style: TextStyle(
//                                       color: isSelected
//                                           ? COLOR_PRIMARY
//                                           : Colors.black,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: COLOR_PRIMARY,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15)),
//                   minimumSize: const Size.fromHeight(50),
//                 ),
//                 // onPressed: () {
//                 //   final selectedItems = controller.getSelectedItems();

//                 //   if (selectedItems.isEmpty) {
//                 //     ScaffoldMessenger.of(context).showSnackBar(
//                 //       const SnackBar(
//                 //           content: Text('Please Select Indicators'),
//                 //           backgroundColor: Colors.red),
//                 //     );
//                 //     return;
//                 //   }

//                 //   final totalPrice = selectedItems.fold(
//                 //     0,
//                 //     (sum, item) => sum + (item['price'] as int),
//                 //   );

//                 //   Navigator.push(
//                 //     context,
//                 //     MaterialPageRoute(
//                 //       builder: (context) => CompareScreen(
//                 //         selectedItems: selectedItems,
//                 //         totalPrice: totalPrice,
//                 //         firstname: firstname,
//                 //         lastname: lastname,
//                 //         age: age,
//                 //         dob: dob,
//                 //         email: email,
//                 //         address: address,
//                 //         tahoeId: tahoeId,
//                 //         socialMediaReport: true,
//                 //        comprehensiveReport: true,
//                 //       ),
//                 //     ),
//                 //   );
//                 // },
//                 onPressed: () {
// // Get selected indicators from controller
//                   final selectedItems = controller.getSelectedItems();

// // Find if comprehensive and social media reports exist
//                   final comprehensiveReport =
//                       controller.fields.firstWhereOrNull(
//                     (field) => field.key == 'haComprehensiveReport',
//                   );
//                   final socialMediaReport = controller.fields.firstWhereOrNull(
//                     (field) => field.key == 'haSocialMediaReport',
//                   );

// // Flags to indicate if these reports exist
//                   final bool comprehensiveIncluded =
//                       comprehensiveReport != null;
//                   final bool socialMediaIncluded = socialMediaReport != null;

// // Add special reports to list with price = 0 (so they don't affect total)
//                   if (comprehensiveIncluded) {
//                     selectedItems.add({
//                       'label': comprehensiveReport!.label,
//                       'key': comprehensiveReport.key,
//                       'price': 0,
//                       'count': 0,
//                     });
//                   }

//                   if (socialMediaIncluded) {
//                     selectedItems.add({
//                       'label': socialMediaReport!.label,
//                       'key': socialMediaReport.key,
//                       'price': 0,
//                       'count': 0,
//                     });
//                   }

// // Calculate total price only for selected user indicators (exclude reports)
//                   final totalPrice = selectedItems.fold<int>(
//                     0,
//                     (sum, item) {
//                       if (item['key'] == 'haComprehensiveReport' ||
//                           item['key'] == 'haSocialMediaReport') {
//                         return sum; // exclude these from total
//                       }
//                       return sum + (item['price'] as int);
//                     },
//                   );

//                   print(selectedItems);
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => CompareScreen(
//                         selectedItems: selectedItems,
//                         totalPrice: totalPrice,
//                         firstname: firstname,
//                         lastname: lastname,
//                         age: age,
//                         dob: dob,
//                         email: email,
//                         address: address,
//                         tahoeId: tahoeId,
//                         socialMedia: socialMediaIncluded,
//                         comprehensiveReport: comprehensiveIncluded,
//                       ),
//                     ),
//                   );
//                 },
//                 child: const Text("Generate Report"),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/models/dynamic_price.dart';
import 'package:virualapi/ui/compare/compare_screen.dart';
import 'addon_controller.dart';

class AddonScreen extends StatelessWidget {
  final Map<String, int>? indicators;
  final String? tahoeId;
  final String? address;
  final String? email;
  final String? firstname;
  final String? lastname;
  final String? age;
  final String? dob;
  final String? gender;

  AddonScreen({
    this.indicators,
    this.tahoeId,
    this.address,
    this.age,
    this.dob,
    this.gender,
    this.email,
    this.firstname,
    this.lastname,
  });

  static const Set<String> specialReportKeys = {
    'haComprehensiveReport',
    'haSocialMediaReport',
  };

  @override
  Widget build(BuildContext context) {
    final AddonController controller =
        Get.put(AddonController(indicators: indicators!));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Indicators"),
        backgroundColor: COLOR_PRIMARY,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.value != null) {
          return Center(child: Text(controller.errorMessage.value!));
        }

        if (controller.selectedIndicators.isEmpty) {
          return Center(
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.warning, size: 48, color: Colors.orange),
                SizedBox(height: 16),
                Text('No Records found', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text('This User Have No Found',
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
          );
        }

        // Filter keys to exclude special reports from checkbox UI
        final visibleIndicatorKeys = controller.selectedIndicators.keys
            .where((key) => !specialReportKeys.contains(key))
            .toList();

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: visibleIndicatorKeys.map((key) {
                    final PricingType field = controller.fields.firstWhere(
                      (field) => field.key == key,
                      orElse: () => PricingType(
                        label: key,
                        key: key,
                        price: 0,
                        count: indicators![key] ?? 0,
                      ),
                    );

                    final isSelected =
                        controller.selectedIndicators[key] ?? false;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          Checkbox(
                            value: isSelected,
                            onChanged: (bool? value) {
                              controller.toggleIndicator(key, value ?? false);
                            },
                            activeColor: COLOR_PRIMARY,
                            checkColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      "${field.label}: ${indicators![key]}",
                                      style: TextStyle(
                                        color: isSelected
                                            ? COLOR_PRIMARY
                                            : Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: Text(
                                    "\$${field.price}",
                                    style: TextStyle(
                                      color: isSelected
                                          ? COLOR_PRIMARY
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: COLOR_PRIMARY,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  minimumSize: const Size.fromHeight(50),
                ),
                // onPressed: () {
                //   // Get selected items (only those user checked)
                //   final selectedItems = controller.getSelectedItems();

                //   // Find special reports dynamically
                //   final comprehensiveReport =
                //       controller.fields.firstWhereOrNull(
                //     (field) => field.key == 'haComprehensiveReport',
                //   );
                //   final socialMediaReport = controller.fields.firstWhereOrNull(
                //     (field) => field.key == 'haSocialMediaReport',
                //   );

                //   // Add special reports with price=0 (always included)
                //   if (comprehensiveReport != null) {
                //     selectedItems.add({
                //       'label': comprehensiveReport.label,
                //       'key': comprehensiveReport.key,
                //       'price': comprehensiveReport.price,
                //       'count': 0,
                //     });
                //   }
                //   if (socialMediaReport != null) {
                //     selectedItems.add({
                //       'label': socialMediaReport.label,
                //       'key': socialMediaReport.key,
                //       'price': socialMediaReport.price,
                //       'count': 0,
                //     });
                //   }

                //   // Calculate total price excluding special reports
                //   final totalPrice = selectedItems.fold<int>(
                //     0,
                //     (sum, item) => specialReportKeys.contains(item['key'])
                //         ? sum
                //         : sum + (item['price'] as int),
                //   );

                //   // Debug print
                //   print('Selected Items: $selectedItems');
                //   print('Total Price: $totalPrice');
                //   print('Total Price: $email');

                //   // Navigate and pass flags for special reports
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => CompareScreen(
                //         selectedItems: selectedItems,
                //         totalPrice: totalPrice,
                //         firstname: firstname,
                //         lastname: lastname,
                //         age: age,
                //         dob: dob,
                //         email: email,
                //         address: address,
                //         tahoeId: tahoeId,
                //         socialMedia: socialMediaReport != null,
                //         comprehensiveReport: comprehensiveReport != null,
                //       ),
                //     ),
                //   );
                // },
                onPressed: () {
                  // Get selected items (only those user checked)
                  final selectedItems = controller.getSelectedItems();

                  // Find special reports dynamically
                  final comprehensiveReport =
                      controller.fields.firstWhereOrNull(
                    (field) => field.key == 'haComprehensiveReport',
                  );
                  final socialMediaReport = controller.fields.firstWhereOrNull(
                    (field) => field.key == 'haSocialMediaReport',
                  );

                  // Add special reports to selectedItems (but count as 0)
                  if (comprehensiveReport != null) {
                    selectedItems.add({
                      'label': comprehensiveReport.label,
                      'key': comprehensiveReport.key,
                      'price': comprehensiveReport.price,
                      'count': 0,
                    });
                  }
                  if (socialMediaReport != null) {
                    selectedItems.add({
                      'label': socialMediaReport.label,
                      'key': socialMediaReport.key,
                      'price': socialMediaReport.price,
                      'count': 0,
                    });
                  }

                  // Check if any non-special reports are selected
                  final validIndicators = selectedItems
                      .where(
                        (item) =>
                            item['key'] != 'haComprehensiveReport' &&
                            item['key'] != 'haSocialMediaReport' &&
                            (item['count'] ?? 0) > 0,
                      )
                      .toList();

                  if (validIndicators.isEmpty) {
                    // No regular indicators selected and no comprehensive report
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please select at least one indicator '),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  // Calculate total price excluding special reports
                  final totalPrice = selectedItems.fold<int>(
                    0,
                    (sum, item) => specialReportKeys.contains(item['key'])
                        ? sum
                        : sum + (item['price'] as int),
                  );
                  print('Selected Items: $selectedItems');
                  print('Total Price: $totalPrice');
                  print('Email: $email');
                  print("Address$address");
                  // Navigate and pass flags for special reports
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CompareScreen(
                        selectedItems: selectedItems,
                        totalPrice: totalPrice,
                        firstname: firstname,
                        lastname: lastname,
                        age: age,
                        dob: dob,
                        email: email,
                        address: address,
                        tahoeId: tahoeId,
                        socialMedia: socialMediaReport != null,
                        comprehensiveReport: comprehensiveReport != null,
                      ),
                    ),
                  );
                },

                child: const Text("Generate Report"),
              ),
            ],
          ),
        );
      }),
    );
  }
}
