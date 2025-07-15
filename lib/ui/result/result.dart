// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:dio/dio.dart';
// import 'package:virualapi/constants/constant.dart';

// import 'dart:io';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/pdf.dart';
// import 'package:share_plus/share_plus.dart';
// import 'dart:convert';

// import 'dart:io';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:pdf/widgets.dart' as pw;
// import 'package:pdf/pdf.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:virualapi/ui/Addon/Addon_screen.dart';

// class ResultScreen extends StatefulWidget {
//   @override
//   _ResultScreenState createState() => _ResultScreenState();
// }

// class _ResultScreenState extends State<ResultScreen> {
//   List<dynamic> persons = [];
//   int currentPage = 1;
//   bool hasNextPage = true;
//   bool isLoading = false;
//   int minAge = 18;
//   int maxAge = 100;
//   double selectedMinAge = 18;
//   double selectedMaxAge = 100;
//   dynamic validIndicators;

//   Map<String, bool> isLoadingMap = {};

//   // ✅ Store FirstName and LastName as state variables
//   String firstName = 'Unknown';
//   String lastName = 'Unknown';

//   // Track loading for each person

//   @override
//   void initState() {
//     super.initState();

//     // Initialize Scroll Controller for Pagination
//     // _scrollController = ScrollController();
//     // _scrollController.addListener(_scrollListener);

//     // Get arguments
//     final args = Get.arguments;
//     if (args != null) {
//       persons = args['persons'] ?? [];

//       currentPage = args['currentPage'] ?? 1;
//       hasNextPage = args['hasNextPage'] ?? true;
//       minAge = args['minAge'] ?? 18;
//       maxAge = args['maxAge'] ?? 100;
//       selectedMinAge = minAge.toDouble();
//       selectedMaxAge = maxAge.toDouble();
//     }

// // Extract first name and last name
//     firstName = (args['FirstName'] as String?)?.trim() ?? 'Unknown';
//     lastName = (args['LastName'] as String?)?.trim() ?? 'Unknown';

//     print("✔ Initial FirstName: $firstName");
//     print("✔ Initial LastName: $lastName");

// // ✅ Extract Indicators for each person
//     // Assuming you are inside the loop that iterates over the persons list

//     for (var person in persons) {
//       String personFirstName = person['FirstName']?.trim() ?? 'Unknown';
//       String personLastName = person['LastName']?.trim() ?? 'Unknown';
//       Map<String, dynamic> indicators = person['indicators'] ?? {};

//       print("➡ Name: $personFirstName $personLastName");
//       print("📊 Indicators: $indicators");

//       // Fix: Correct type for filtering indicators where value is greater than 0
//       Map<String, int> validIndicators = Map.fromEntries(
//         indicators.entries.where((MapEntry<String, dynamic> entry) {
//           // Ensure entry.value is of type int and greater than 0
//           return entry.value is int && entry.value > 0;
//         }).map((entry) {
//           return MapEntry(entry.key, entry.value as int); // Safely cast to int
//         }),
//       );

//       this.validIndicators = validIndicators;

//       print("✅ Valid Indicators: $validIndicators");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<dynamic> filteredPersons = persons.where((person) {
//       int age = person['age'] != null
//           ? int.tryParse(person['age'].toString()) ?? 0
//           : 0;
//       return age >= selectedMinAge && age <= selectedMaxAge;
//     }).toList();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Search Results",
//         ),
//         backgroundColor: COLOR_PRIMARY,
//       ),
//       body: Column(
//         children: [
//           // 📌 Age Range Slider
//           Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                     "Filter by Age (${selectedMinAge.toInt()} - ${selectedMaxAge.toInt()})"),
//                 RangeSlider(
//                   activeColor: COLOR_PRIMARY,
//                   values: RangeValues(selectedMinAge, selectedMaxAge),
//                   min: minAge.toDouble(),
//                   max: maxAge.toDouble(),
//                   divisions: (maxAge - minAge),
//                   labels: RangeLabels(
//                     '${selectedMinAge.toInt()}',
//                     '${selectedMaxAge.toInt()}',
//                   ),
//                   onChanged: (RangeValues newValues) {
//                     setState(() {
//                       selectedMinAge = newValues.start;
//                       selectedMaxAge = newValues.end;
//                     });
//                   },
//                 ),
//               ],
//             ),
//           ),

//           // 📌 Display Filtered Results + Pagination Loader
//           Expanded(
//             child: ListView.builder(
//               // itemCount: filteredPersons.length + (hasNextPage ? 1 : 0),
//               itemCount: filteredPersons.length,
//               itemBuilder: (context, index) {
//                 if (index == filteredPersons.length) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 var person = filteredPersons[index];
//                 String tahoeId = person['tahoeId']?.toString() ?? '';

//                 var emailList =
//                     person['emailAddresses'] as List<dynamic>? ?? [];
//                 var phoneList = person['phoneNumbers'] as List<dynamic>? ?? [];
//                 var addressList = person['addresses'] as List<dynamic>? ?? [];
//                 String firstName = person['name']['firstName'] ?? 'Unknown';
//                 String lastName = person['name']['lastName'] ?? 'Unknown';
//                 String key = "$firstName-$lastName"; // ✅ Define key here
//                 String email = emailList.isNotEmpty
//                     ? emailList.first['emailAddress']
//                     : "No email available";
//                 String phone = phoneList.isNotEmpty
//                     ? phoneList.first['phoneNumber'] ?? "No phone available"
//                     : "No phone available";
//                 String address = addressList.isNotEmpty
//                     ? "${addressList.first['street'] ?? 'Unknown'}, "
//                         "${addressList.first['city'] ?? ''}, "
//                         "${addressList.first['state'] ?? ''}, "
//                         "${addressList.first['zip'] ?? ''}"
//                     : "No address available";

//                 return Card(
//                   child: ListTile(
//                     title: Text(
//                       "${person['name']['firstName'] ?? 'Unknown'} ${person['name']['lastName'] ?? ''}",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Age: ${person['age'] ?? 'N/A'}",
//                             style: TextStyle(
//                                 fontSize: 14, fontWeight: FontWeight.w500)),

//                         // 📞 Phone Number
//                         Text(
//                           "Phone: $phone",
//                           style: TextStyle(fontSize: 14),
//                         ),

//                         Text(
//                           "Email: $email",
//                           style: TextStyle(fontSize: 14),
//                         ),

//                         Text(
//                           "Address: $address",
//                           style: TextStyle(fontSize: 14),
//                         ),
//                       ],
//                     ),
//                     trailing: isLoadingMap[key] == true
//                         ? CircularProgressIndicator()
//                         : TextButton.icon(
//                             icon: Icon(Icons.description),
//                             onPressed: () {
//                               Map<String, int> validIndicators =
//                                   Map.fromEntries(
//                                 (person['indicators'] as Map<String, dynamic>)
//                                     .entries
//                                     .where((MapEntry<String, dynamic> entry) =>
//                                         entry.value is int && entry.value > 0)
//                                     .map((MapEntry<String, dynamic> entry) =>
//                                         MapEntry(
//                                             entry.key, entry.value as int)),
//                               );
//                               print("Person Indicator$validIndicators");
//                               Get.to(AddonScreen(
//                                   indicators: validIndicators,
//                                   tahoeId: tahoeId));
//                             },
//                             label: Text('Full Report'),
//                           ),
//                   ),
//                 );
//               },
//             ),
//           ),

//           // 📌 Bottom Loader for Load More
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/ui/Addon/Addon_screen.dart';
import 'package:virualapi/utils/metrics.dart';

class ResultScreen extends StatefulWidget {
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  List<dynamic> persons = [];
  int currentPage = 1;
  int itemsPerPage = 10;
  int totalPages = 0;
  int minAge = 18;
  int maxAge = 100;
  double selectedMinAge = 18;
  double selectedMaxAge = 100;
  Map<String, bool> isLoadingMap = {};
  String firstName = 'Unknown';
  String lastName = 'Unknown';

  @override
  void initState() {
    super.initState();

    final args = Get.arguments;
    if (args != null) {
      persons = args['persons'] ?? [];
      currentPage = args['currentPage'] ?? 1;
      minAge = args['minAge'] ?? 18;
      maxAge = args['maxAge'] ?? 100;
      totalPages = args['totalpages'] ?? 0;
      selectedMinAge = minAge.toDouble();
      selectedMaxAge = maxAge.toDouble();

      firstName = (args['FirstName'] as String?)?.trim() ?? 'Unknown';
      lastName = (args['LastName'] as String?)?.trim() ?? 'Unknown';
    }
    print(totalPages);

    totalPages = (getFilteredPersons().length / itemsPerPage).ceil();
  }

  List<dynamic> getFilteredPersons() {
    return persons.where((person) {
      int age = person['age'] != null
          ? int.tryParse(person['age'].toString()) ?? 0
          : 0;
      return age >= selectedMinAge && age <= selectedMaxAge;
    }).toList();
  }

  List<dynamic> getPaginatedPersons() {
    List<dynamic> filtered = getFilteredPersons();
    totalPages = (filtered.length / itemsPerPage).ceil();

    int start = (currentPage - 1) * itemsPerPage;
    int end = start + itemsPerPage;
    if (end > filtered.length) end = filtered.length;
    return filtered.sublist(start, end);
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> paginatedPersons = getPaginatedPersons();

    return Scaffold(
      appBar: AppBar(
        title: Text("Search Results"),
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
                  "Filter by Age (${selectedMinAge.toInt()} - ${selectedMaxAge.toInt()})",
                  style: TextStyle(color: COLOR_PRIMARY),
                ),
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
                      currentPage = 1; // reset page on filter change
                    });
                  },
                ),
              ],
            ),
          ),

          // 📌 Display Results
          Expanded(
            child: ListView.builder(
              itemCount: paginatedPersons.length,
              itemBuilder: (context, index) {
                var person = paginatedPersons[index];
                String tahoeId = person['tahoeId']?.toString() ?? '';

                var emailList =
                    person['emailAddresses'] as List<dynamic>? ?? [];
                var phoneList = person['phoneNumbers'] as List<dynamic>? ?? [];
                var addressList = person['addresses'] as List<dynamic>? ?? [];
                String firstName = person['name']['firstName'] ?? 'Unknown';
                String lastName = person['name']['lastName'] ?? 'Unknown';
                String key = "$firstName-$lastName";
                String age = person['age'].toString() ?? 'N/A';
                String gender = person['gender'] ?? 'N/A';
                String dob = person['dob'].toString() ?? 'N/A';
                String email = emailList.isNotEmpty
                    ? emailList.first['emailAddress']
                    : "No email available";
                String phone = phoneList.isNotEmpty
                    ? phoneList.first['phoneNumber'] ?? "No phone available"
                    : "No phone available";
                String address = addressList.isNotEmpty
                    ? "${addressList.first['city'] ?? ''}, "
                        "${addressList.first['state'] ?? ''}, "
                        "${addressList.first['zip'] ?? ''}"
                    : "No address available";

                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: COLOR_PRIMARY, width: 0.7),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    title: Text(
                      "$firstName $lastName",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: DARK_BG_COLOR,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Age: $age",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: DARK_BG_COLOR,
                            )),
                        // Text("Phone: $phone", style: TextStyle(fontSize: 14)),
                        // Text("Email: $email", style: TextStyle(fontSize: 14)),
                        Text("Address: $address",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              color: DARK_BG_COLOR,
                            )),
                      ],
                    ),
                    trailing: isLoadingMap[key] == true
                        ? CircularProgressIndicator()
                        : Container(
                            // height: 80,
                            width: 100,
                            margin: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              // color: COLOR_PRIMARY.withAlpha(30),
                              // color: Colors.white,

                              border:
                                  Border.all(color: Colors.white70, width: 0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextButton.icon(
                              icon: Icon(
                                Icons.description,
                                color: COLOR_GREEEN_TEXT,
                              ),
                              onPressed: () {
                                Map<String, int> validIndicators =
                                    Map.fromEntries(
                                  (person['indicators'] as Map<String, dynamic>)
                                      .entries
                                      .where((entry) =>
                                          entry.value is int && entry.value > 0)
                                      .map((entry) => MapEntry(
                                          entry.key, entry.value as int)),
                                );

                                // final userinfo = {
                                //   'firstname': firstName,
                                //   'lastname': lastName,
                                //   'age': age,
                                //   'gender': gender,
                                //   'dob': dob,
                                //   'email': email,
                                //   'address': address,
                                // };

                                // Get.to(AddonScreen(
                                //   indicators: validIndicators,
                                //   tahoeId: tahoeId,
                                //   userseleect: userinfo,
                                // ));

                                Get.to(AddonScreen(
                                    indicators: validIndicators,
                                    tahoeId: tahoeId,
                                    firstname: firstName,
                                    lastname: lastName,
                                    age: age,
                                    gender: gender,
                                    dob: dob,
                                    email: email,
                                    address: address));
                              },
                              label: Text(
                                'Full Report',
                                style: TextStyle(
                                  color: DARK_BG_COLOR,
                                ),
                              ),
                            ),
                          ),
                  ),
                );
              },
            ),
          ),

          // 📌 Pagination Buttons
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: currentPage > 1
                      ? () {
                          setState(() {
                            currentPage--;
                          });
                        }
                      : null,
                  child:
                      Text("Previous", style: TextStyle(color: COLOR_PRIMARY)),
                ),
                Text(
                  "Page $currentPage of $totalPages",
                  style: TextStyle(
                      color: COLOR_PRIMARY, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: currentPage < totalPages
                      ? () {
                          setState(() {
                            currentPage++;
                          });
                        }
                      : null,
                  child: Text(
                    "Next",
                    style: TextStyle(color: COLOR_PRIMARY),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
