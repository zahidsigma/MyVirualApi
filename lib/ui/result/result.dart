import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:virualapi/constants/constant.dart';

import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:convert';

import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:virualapi/ui/Addon/Addon_screen.dart';

class ResultScreen extends StatefulWidget {
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  List<dynamic> persons = [];
  int currentPage = 1;
  bool hasNextPage = true;
  bool isLoading = false;
  int minAge = 18;
  int maxAge = 100;
  double selectedMinAge = 18;
  double selectedMaxAge = 100;
  dynamic validIndicators;

  Map<String, bool> isLoadingMap = {};

  // ✅ Store FirstName and LastName as state variables
  String firstName = 'Unknown';
  String lastName = 'Unknown';

  // Track loading for each person

  @override
  void initState() {
    super.initState();

    // Initialize Scroll Controller for Pagination
    // _scrollController = ScrollController();
    // _scrollController.addListener(_scrollListener);

    // Get arguments
    final args = Get.arguments;
    if (args != null) {
      persons = args['persons'] ?? [];

      currentPage = args['currentPage'] ?? 1;
      hasNextPage = args['hasNextPage'] ?? true;
      minAge = args['minAge'] ?? 18;
      maxAge = args['maxAge'] ?? 100;
      selectedMinAge = minAge.toDouble();
      selectedMaxAge = maxAge.toDouble();
    }

// Extract first name and last name
    firstName = (args['FirstName'] as String?)?.trim() ?? 'Unknown';
    lastName = (args['LastName'] as String?)?.trim() ?? 'Unknown';

    print("✔ Initial FirstName: $firstName");
    print("✔ Initial LastName: $lastName");

// ✅ Extract Indicators for each person
    // Assuming you are inside the loop that iterates over the persons list

    for (var person in persons) {
      String personFirstName = person['FirstName']?.trim() ?? 'Unknown';
      String personLastName = person['LastName']?.trim() ?? 'Unknown';
      Map<String, dynamic> indicators = person['indicators'] ?? {};

      print("➡ Name: $personFirstName $personLastName");
      print("📊 Indicators: $indicators");

      // Fix: Correct type for filtering indicators where value is greater than 0
      Map<String, int> validIndicators = Map.fromEntries(
        indicators.entries.where((MapEntry<String, dynamic> entry) {
          // Ensure entry.value is of type int and greater than 0
          return entry.value is int && entry.value > 0;
        }).map((entry) {
          return MapEntry(entry.key, entry.value as int); // Safely cast to int
        }),
      );

      this.validIndicators = validIndicators;

      print("✅ Valid Indicators: $validIndicators");
    }
  }

  // void navigateToAddonScreen(Map<String, dynamic> person) {
  //   // Ensure that the indicators are of type Map<String, dynamic>
  //   Map<String, int> validIndicators = Map.fromEntries(
  //     person['indicators'].entries.where((MapEntry<String, dynamic> entry) {
  //       // Check if the value is of type int and greater than 0
  //       return entry.value is int && entry.value > 0;
  //     }).map((MapEntry<String, dynamic> entry) {
  //       // Safely cast the value to int
  //       return MapEntry(entry.key, entry.value as int);
  //     }),
  //   );

  //   // Pass validIndicators to the next screen using Get.to()
  //   Get.to(
  //     AddonScreen(indicators: validIndicators),
  //   );
  // }

  // Future<void> fetchFullReport(String tahoeId) async {
  //   String key = "$tahoeId"; // Unique key for each person

  //   // ✅ Ensure `setState` only runs if the widget is still mounted
  //   if (mounted) {
  //     setState(() {
  //       isLoadingMap[key] = true; // Start loading for this person
  //     });
  //   }

  //   try {
  //     final String apiUrl = 'https://api.galaxysearchapi.com/personsearch';

  //     final Map<String, String> headers = {
  //       'Galaxy-Ap-Password': '2397b0ba0f8a4ea0aaea17e781e11305',
  //       'Galaxy-Search-Type': 'BackgroundReport',
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //       'Galaxy-Ap-Name': 'ethosinv',
  //     };

  //     final Map<String, dynamic> requestBody = {
  //       "tahoeId": tahoeId, // Use `tahoeId` instead of first/last name
  //     };

  //     Dio dio = Dio();
  //     dio.options.headers = headers;

  //     final response = await dio.post(apiUrl, data: requestBody);

  //     if (response.statusCode == 200 && response.data != null) {
  //       var fullReport = response.data;
  //       print("FULLL REOPRT: $fullReport");

  //       // ✅ Ensure Navigation is safe
  //       if (mounted) {
  //         Get.to(() => AddonsScreen(), arguments: {
  //           'fullReport': fullReport,
  //         });
  //       }
  //     } else {
  //       if (mounted) {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text("Failed to fetch report")),
  //         );
  //       }
  //     }
  //   } on DioException catch (e) {
  //     if (mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text("Something went wrong: ${e.message}")),
  //       );
  //     }
  //   } catch (e) {
  //     if (mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text("Unexpected error: $e")),
  //       );
  //     }
  //   }

  //   // ✅ Ensure `setState` only runs if the widget is still mounted
  //   if (mounted) {
  //     setState(() {
  //       isLoadingMap[key] = false; // Stop loading for this person
  //     });
  //   }
  // }

  // 📌 Function to Fetch Next Page of Data

  // 📌 Scroll Listener for Auto Load More
  // void _scrollListener() {
  //   if (_scrollController.position.pixels >=
  //           _scrollController.position.maxScrollExtent - 200 &&
  //       !isLoading &&
  //       hasNextPage) {
  //     print("🔄 Load more triggered!");
  //     _loadMoreData();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredPersons = persons.where((person) {
      int age = person['age'] != null
          ? int.tryParse(person['age'].toString()) ?? 0
          : 0;
      return age >= selectedMinAge && age <= selectedMaxAge;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search Results",
        ),
        backgroundColor: COLOR_PRIMARY,
      ),
      body: Column(
        children: [
          // 📌 Age Range Slider
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Filter by Age (${selectedMinAge.toInt()} - ${selectedMaxAge.toInt()})"),
                RangeSlider(
                  activeColor: COLOR_PRIMARY,
                  values: RangeValues(selectedMinAge, selectedMaxAge),
                  min: minAge.toDouble(),
                  max: maxAge.toDouble(),
                  divisions: (maxAge - minAge),
                  labels: RangeLabels(
                    '${selectedMinAge.toInt()}',
                    '${selectedMaxAge.toInt()}',
                  ),
                  onChanged: (RangeValues newValues) {
                    setState(() {
                      selectedMinAge = newValues.start;
                      selectedMaxAge = newValues.end;
                    });
                  },
                ),
              ],
            ),
          ),

          // 📌 Display Filtered Results + Pagination Loader
          Expanded(
            child: ListView.builder(
              // itemCount: filteredPersons.length + (hasNextPage ? 1 : 0),
              itemCount: filteredPersons.length,
              itemBuilder: (context, index) {
                if (index == filteredPersons.length) {
                  return Center(child: CircularProgressIndicator());
                }
                var person = filteredPersons[index];
                String tahoeId = person['tahoeId']?.toString() ?? '';

                var emailList =
                    person['emailAddresses'] as List<dynamic>? ?? [];
                var phoneList = person['phoneNumbers'] as List<dynamic>? ?? [];
                var addressList = person['addresses'] as List<dynamic>? ?? [];
                String firstName = person['name']['firstName'] ?? 'Unknown';
                String lastName = person['name']['lastName'] ?? 'Unknown';
                String key = "$firstName-$lastName"; // ✅ Define key here
                String email = emailList.isNotEmpty
                    ? emailList.first['emailAddress']
                    : "No email available";
                String phone = phoneList.isNotEmpty
                    ? phoneList.first['phoneNumber'] ?? "No phone available"
                    : "No phone available";
                String address = addressList.isNotEmpty
                    ? "${addressList.first['street'] ?? 'Unknown'}, "
                        "${addressList.first['city'] ?? ''}, "
                        "${addressList.first['state'] ?? ''}, "
                        "${addressList.first['zip'] ?? ''}"
                    : "No address available";

                return Card(
                  child: ListTile(
                    title: Text(
                      "${person['name']['firstName'] ?? 'Unknown'} ${person['name']['lastName'] ?? ''}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Age: ${person['age'] ?? 'N/A'}",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500)),

                        // 📞 Phone Number
                        Text(
                          "Phone: $phone",
                          style: TextStyle(fontSize: 14),
                        ),

                        Text(
                          "Email: $email",
                          style: TextStyle(fontSize: 14),
                        ),

                        Text(
                          "Address: $address",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    trailing: isLoadingMap[key] == true
                        ? CircularProgressIndicator()
                        : TextButton.icon(
                            icon: Icon(Icons.description),
                            onPressed: () {
                              Map<String, int> validIndicators =
                                  Map.fromEntries(
                                (person['indicators'] as Map<String, dynamic>)
                                    .entries
                                    .where((MapEntry<String, dynamic> entry) =>
                                        entry.value is int && entry.value > 0)
                                    .map((MapEntry<String, dynamic> entry) =>
                                        MapEntry(
                                            entry.key, entry.value as int)),
                              );

                              Get.to(AddonScreen(
                                  indicators: validIndicators,
                                  tahoeId: tahoeId));
                            },
                            label: Text('Full Report'),
                          ),
                  ),
                );
              },
            ),
          ),

          // 📌 Bottom Loader for Load More
        ],
      ),
    );
  }
}

// class PersonDetailScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // ✅ Extract data from arguments
//     final Map<String, dynamic>? args = Get.arguments;
//     final List<dynamic> personsList = args?['fullReport']?['persons'] ?? [];
//     final Map<String, dynamic> personData = (personsList.isNotEmpty
//         ? personsList.first
//         : {}) as Map<String, dynamic>;

//     // 🔹 Extracting required data
//     var fullName = personData['fullName'] ?? 'Unknown';
//     var dob = personData['dob'] ?? 'Unknown';
//     var age = personData['age']?.toString() ?? 'Unknown';
//     var phoneNumbers = personData['phoneNumbers'] as List<dynamic>?;
//     var emails = personData['emailAddresses'] as List<dynamic>?;
//     var addresses = personData['addresses'] as List<dynamic>?;
//     var relatives = personData['relatives'] as List<dynamic>?;
//     var associates = personData['associates'] as List<dynamic>?;
//     var businessRecords = personData['businessRecords'] as List<dynamic>?;
//     // Extract criminal records safely as a list
//     final List<dynamic> criminalRecords = personData['criminalV2Records'] ?? [];

//     var debtRecords = personData['debtV2Records'] as List<dynamic>?;
//     var lienRecords = personData['lienSearchIds'] as List<dynamic>?;
//     var bankruptcyRecords = personData['bankruptcySearchIds'] as List<dynamic>?;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Person Details'),
//         backgroundColor: Colors.blueAccent,
//         actions: [
//           IconButton(
//               icon: Icon(Icons.document_scanner, color: Colors.white),
//               onPressed: () {
//                 generatePdf(personData);
//               }),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // 🔹 Basic Information
//             _buildInfoRow('🆔 Full Name', fullName),
//             _buildInfoRow('📅 Date of Birth', dob),
//             _buildInfoRow('🎂 Age', age),

//             const SizedBox(height: 16),

//             // 🔹 Contact Details
//             _buildSectionTitle('📞 Phone Numbers'),
//             _buildList(
//                 phoneNumbers, 'phoneNumber', 'No phone numbers available'),

//             const SizedBox(height: 16),

//             _buildSectionTitle('📧 Email Addresses'),
//             _buildList(emails, 'emailAddress', 'No email addresses available'),

//             const SizedBox(height: 16),

//             _buildSectionTitle('📍 Addresses'),
//             _buildList(addresses, 'fullAddress', 'No addresses available'),

//             const SizedBox(height: 16),

//             // 🔹 Social & Business Connections
//             _buildSectionTitle('👨‍👩‍👧 Relatives'),
//             _buildList(relatives, 'fullName', 'No relatives available'),

//             const SizedBox(height: 16),

//             _buildSectionTitle('🤝 Associates'),
//             _buildList(associates, 'fullName', 'No associates available'),

//             const SizedBox(height: 16),

//             _buildSectionTitle('🏢 Business Records'),
//             _buildList(businessRecords, 'businessName',
//                 'No business records available'),

//             const SizedBox(height: 16),

//             // 🔹 Financial & Legal History
//             _buildSectionTitle('⚖️ Criminal Records'),
//             _buildList(
//                 criminalRecords, 'caseDetails', 'No criminal records found'),

//             const SizedBox(height: 16),

//             _buildSectionTitle('💰 Debt Records'),
//             _buildList(debtRecords, 'debtDetails', 'No debt records found'),

//             const SizedBox(height: 16),

//             _buildSectionTitle('📜 Lien Records'),
//             _buildList(lienRecords, 'lienDetails', 'No lien records found'),

//             const SizedBox(height: 16),

//             _buildSectionTitle('🏦 Bankruptcy Records'),
//             _buildList(bankruptcyRecords, 'bankruptcyDetails',
//                 'No bankruptcy records found'),
//           ],
//         ),
//       ),
//     );
//   }

//   // 🔹 Reusable Widget for Information Rows
//   Widget _buildInfoRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         children: [
//           Text(
//             "$label: ",
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           Expanded(
//             child: Text(
//               value,
//               style: const TextStyle(fontSize: 16),
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // 🔹 Reusable Widget for Section Titles
//   Widget _buildSectionTitle(String title) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Text(
//         title,
//         style: const TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Colors.blueAccent),
//       ),
//     );
//   }

//   // 🔹 Reusable Widget for Dynamic Lists
//   Widget _buildList(List<dynamic>? items, String key, String noDataMessage) {
//     if (items == null || items.isEmpty) {
//       return _buildNoDataText(noDataMessage);
//     }

//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: items.length,
//       itemBuilder: (context, index) {
//         final item = items[index];

//         // Check if the item is a Map and contains the expected key
//         String displayText;
//         if (item is Map<String, dynamic> && item.containsKey(key)) {
//           displayText = item[key]?.toString() ?? 'Unknown';
//         } else if (item is String) {
//           displayText = item; // Directly display if it's a string
//         } else {
//           displayText = 'Unknown Data Format';
//         }

//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 2),
//           child: Text(
//             displayText,
//             style: const TextStyle(fontSize: 16),
//           ),
//         );
//       },
//     );
//   }

//   // 🔹 Reusable Widget for No Data Message
//   Widget _buildNoDataText(String message) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Text(
//         message,
//         style: const TextStyle(fontSize: 14, color: Colors.grey),
//       ),
//     );
//   }
// }

// Future<void> generatePdf(Map<String, dynamic> personData) async {
//   final pdf = pw.Document();

//   // ✅ Use Default Font (No need to load a custom font)
//   final font = pw.Font.helvetica();
//   final boldFont = pw.Font.helveticaBold();

//   pdf.addPage(
//     pw.Page(
//       pageFormat: PdfPageFormat.a4,
//       build: (pw.Context context) {
//         return pw.Padding(
//           padding: pw.EdgeInsets.all(16),
//           child: pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               pw.Text("Person Report",
//                   style: pw.TextStyle(
//                       fontSize: 24,
//                       fontWeight: pw.FontWeight.bold,
//                       font: boldFont)),
//               pw.SizedBox(height: 10),
//               _buildPdfRow("Full Name", personData['fullName'], font),
//               _buildPdfRow("Date of Birth", personData['dob'], font),
//               _buildPdfRow("Age", personData['age']?.toString(), font),
//               pw.SizedBox(height: 10),
//               _buildPdfSection(
//                   "Phone Numbers", personData['phoneNumbers'], font),
//               _buildPdfSection(
//                   "Email Addresses", personData['emailAddresses'], font),
//               _buildPdfSection("Addresses", personData['addresses'], font),
//               pw.SizedBox(height: 10),
//               _buildPdfSection("Relatives", personData['relatives'], font),
//               _buildPdfSection("Associates", personData['associates'], font),
//               _buildPdfSection(
//                   "Business Records", personData['businessRecords'], font),
//               pw.SizedBox(height: 10),
//               _buildPdfSection(
//                   "Criminal Records", personData['criminalV2Records'], font),
//               _buildPdfSection(
//                   "Debt Records", personData['debtV2Records'], font),
//               _buildPdfSection(
//                   "Lien Records", personData['lienSearchIds'], font),
//               _buildPdfSection("Bankruptcy Records",
//                   personData['bankruptcySearchIds'], font),
//             ],
//           ),
//         );
//       },
//     ),
//   );

//   // Save PDF to device
//   final output = await getTemporaryDirectory();
//   final file = File("${output.path}/person_report.pdf");
//   await file.writeAsBytes(await pdf.save());

//   // Share or open the file
//   Share.shareXFiles([XFile(file.path)], text: "Download the report");
// }

// // 📝 Function to Format Row
// pw.Widget _buildPdfRow(String title, String? value, pw.Font font) {
//   return pw.Padding(
//     padding: pw.EdgeInsets.symmetric(vertical: 2),
//     child: pw.Text("$title: ${value ?? 'N/A'}",
//         style: pw.TextStyle(fontSize: 16, font: font)),
//   );
// }

// // 📋 Function to Format Lists in PDF
// pw.Widget _buildPdfSection(String title, List<dynamic>? items, pw.Font font) {
//   if (items == null || items.isEmpty) {
//     return pw.Text("$title: No data available",
//         style: pw.TextStyle(fontSize: 14, color: PdfColors.grey, font: font));
//   }

//   return pw.Column(
//     crossAxisAlignment: pw.CrossAxisAlignment.start,
//     children: [
//       pw.Text(title,
//           style: pw.TextStyle(
//               fontSize: 16, fontWeight: pw.FontWeight.bold, font: font)),
//       pw.SizedBox(height: 5),
//       ...items.map((item) {
//         if (item is Map<String, dynamic>) {
//           return pw.Text(
//               item.entries.map((e) => "${e.key}: ${e.value}").join(", "),
//               style: pw.TextStyle(fontSize: 14, font: font));
//         } else {
//           return pw.Text(item.toString(),
//               style: pw.TextStyle(fontSize: 14, font: font));
//         }
//       }),
//       pw.SizedBox(height: 5),
//     ],
//   );
// }

// class AddonScreen extends StatefulWidget {
//   final Map<String, int> indicators;

//   // Constructor to accept indicators passed from the previous screen
//   AddonScreen({required this.indicators});

//   @override
//   _AddonScreenState createState() => _AddonScreenState();
// }

// class _AddonScreenState extends State<AddonScreen> {
//   // This map will track the state of each checkbox (checked or unchecked)
//   late Map<String, bool> selectedIndicators;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize the selectedIndicators map where each key (indicator) starts as unchecked (false)
//     selectedIndicators = {
//       for (var entry in widget.indicators.entries) entry.key: false,
//     };
//     print(selectedIndicators);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Full Report"),
//         backgroundColor: COLOR_PRIMARY, // Customize app bar color
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // List of checkboxes based on indicators
//             Expanded(
//               child: ListView(
//                 children: widget.indicators.entries.map((entry) {
//                   return CheckboxListTile(
//                     checkColor: Colors.white, // Color of the check mark
//                     checkboxShape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                     title: Text(
//                       "${entry.key}: ${entry.value}",
//                       style: TextStyle(
//                         color: selectedIndicators[entry.key]!
//                             ? COLOR_PRIMARY
//                             : Colors
//                                 .black, // Change text color based on selection
//                       ),
//                     ),
//                     value:
//                         selectedIndicators[entry.key], // Current selected state
//                     onChanged: (bool? value) {
//                       setState(() {
//                         // Update the checkbox state for the indicator
//                         selectedIndicators[entry.key] = value ?? false;
//                       });
//                     },
//                     activeColor: COLOR_PRIMARY, // Checkbox color when selected
//                     // Selected tile background color
//                   );
//                 }).toList(),
//               ),
//             ),

//             // Generate Report button (without bottom navigation bar)
//             ElevatedButton(
//               onPressed: () {
//                 // When the "Generate Report" button is pressed, show selected indicators
//                 List<String> selectedKeys = selectedIndicators.entries
//                     .where((entry) =>
//                         entry.value) // Filter to get only checked indicators
//                     .map((entry) => entry.key)
//                     .toList();

//                 // You can use these selectedKeys for further actions, e.g., generating a report
//                 print("Selected Indicators: $selectedKeys");

//                 // You can also navigate to a new screen or show a dialog with the report
//                 // For example: showDialog(context: context, builder: (context) => ReportDialog(selectedIndicators: selectedKeys));
//               },
//               child: Text("Generate Report"),
//               style: ElevatedButton.styleFrom(backgroundColor: COLOR_PRIMARY),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ConfirmScreen extends StatefulWidget {
//   final List<Map<String, dynamic>> selectedItems;
//   final int totalPrice;

//   const ConfirmScreen({
//     required this.selectedItems,
//     required this.totalPrice,
//   });

//   @override
//   _ConfirmScreenState createState() => _ConfirmScreenState();
// }

// class _ConfirmScreenState extends State<ConfirmScreen> {
//   bool _comprehensiveReport = false;
//   bool _socialMediaRepost = false;
//   final int _comprehensiveReportPrice = 80;
//   final int _socialMediaFee = 20;

//   @override
//   Widget build(BuildContext context) {
//     final indicatorTotal = _comprehensiveReport ? 0 : widget.totalPrice;
//     final servicesTotal = _comprehensiveReport ? _comprehensiveReportPrice : 0;
//     final socialTotal = _socialMediaRepost ? _socialMediaFee : 0;
//     final grandTotal = indicatorTotal + servicesTotal + socialTotal;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Order Confirmation'),
//         backgroundColor: COLOR_PRIMARY,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Indicators List with fixed height
//             if (!_comprehensiveReport)
//               SizedBox(
//                 height: 300, // Fixed height here
//                 child: Card(
//                   child: Padding(
//                     padding: EdgeInsets.all(12),
//                     child: Column(
//                       children: [
//                         Text(
//                           'Selected Indicators',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Expanded(
//                           child: ListView.builder(
//                             shrinkWrap: true,
//                             itemCount: widget.selectedItems.length,
//                             itemBuilder: (context, index) {
//                               final item = widget.selectedItems[index];
//                               return ListTile(
//                                 contentPadding: EdgeInsets.zero,
//                                 dense: true,
//                                 title: Text(
//                                   item['label'],
//                                   style: TextStyle(fontSize: 14),
//                                 ),
//                                 trailing: Text(
//                                   '\$${item['price']}',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.green,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                         Divider(height: 1),
//                         Padding(
//                           padding: EdgeInsets.only(top: 4),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'Subtotal:',
//                                 style: TextStyle(fontSize: 14),
//                               ),
//                               Text(
//                                 '\$${widget.totalPrice}',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.green,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             SizedBox(height: 12),

//             // Rest of your existing widgets...
//             Card(
//               child: CheckboxListTile(
//                 activeColor: Colors.white,
//                 checkColor: COLOR_PRIMARY,
//                 title: Text('Comprehensive Report'),
//                 subtitle: Text(_comprehensiveReport
//                     ? 'Selected (\$$_comprehensiveReportPrice)'
//                     : 'Replace indicators with full report (\$$_comprehensiveReportPrice)'),
//                 value: _comprehensiveReport,
//                 onChanged: (bool? value) =>
//                     setState(() => _comprehensiveReport = value ?? false),
//                 secondary: Icon(Icons.assignment),
//               ),
//             ),

//             Card(
//               child: CheckboxListTile(
//                 activeColor: Colors.white,
//                 checkColor: COLOR_PRIMARY,
//                 title: Text('Social Media Repost'),
//                 subtitle: Text('\$$_socialMediaFee • Shared within 24 hours'),
//                 value: _socialMediaRepost,
//                 onChanged: (bool? value) =>
//                     setState(() => _socialMediaRepost = value ?? false),
//                 secondary: Icon(Icons.share),
//               ),
//             ),

//             Card(
//               color: Colors.white,
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     if (_comprehensiveReport)
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('Comprehensive Report:'),
//                           Text('\$$_comprehensiveReportPrice'),
//                         ],
//                       ),
//                     if (!_comprehensiveReport)
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('Indicators Total:'),
//                           Text('\$${widget.totalPrice}'),
//                         ],
//                       ),
//                     if (_socialMediaRepost)
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('Social Media Repost:'),
//                           Text('\$$_socialMediaFee'),
//                         ],
//                       ),
//                     Divider(),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text('TOTAL:',
//                             style: TextStyle(fontWeight: FontWeight.bold)),
//                         Text('\$$grandTotal',
//                             style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.green)),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             Spacer(),
//             ElevatedButton(
//               onPressed: () => _showConfirmation(context, grandTotal),
//               child: Text('CONFIRM ORDER'),
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

//   void _showConfirmation(BuildContext context, int total) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Confirm Payment'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text('You are purchasing:'),
//             SizedBox(height: 8),
//             Text(_comprehensiveReport
//                 ? 'Comprehensive Report'
//                 : '${widget.selectedItems.length} Indicators'),
//             if (_socialMediaRepost) Text('+ Social Media Repost'),
//             Divider(),
//             Text('Total Amount:',
//                 style: TextStyle(fontWeight: FontWeight.bold)),
//             Text('\$$total',
//                 style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.green)),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text('CANCEL'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text('Order confirmed! Total: \$$total')),
//               );
//             },
//             child: Text('CONFIRM'),
//           ),
//         ],
//       ),
//     );
//   }
// }
