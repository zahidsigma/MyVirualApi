// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:virualapi/constants/constant.dart';
// import 'package:virualapi/ui/home/home_controller.dart';
// import 'package:virualapi/utils/metrics.dart';
// import 'package:collection/collection.dart';

// class BottomNavBar extends StatefulWidget {
//   final void Function(int index) indexChanged;
//   BottomNavBar({super.key, required this.indexChanged});

//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   int selectedScreenIndex = 0;
//   final selectedItemColor = COLOR_PRIMARY;
//   final unselectedItemColor = Colors.grey;

//   isSelected(index) => selectedScreenIndex == index;
//   getColor(index) =>
//       isSelected(index) ? selectedItemColor : unselectedItemColor;

//   BottomNavigationBarItem getNavItem(item, index) => BottomNavigationBarItem(
//         label: item["title"],
//         icon: Image.asset(
//           "assets/images/${item['icon']}",
//           width: getScreenWidth(context) * (index != 1 ? 0.075 : 0.1),
//           height: getScreenHeight(context) * 0.05,
//           color: getColor(index),
//           fit: BoxFit.scaleDown,
//         ),
//       );

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//         key: Get.find<HomeController>().bottomWidgetKey,
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: selectedItemColor,
//         unselectedItemColor: unselectedItemColor,
//         backgroundColor: Colors.white,
//         currentIndex: selectedScreenIndex,
//         onTap: (index) {
//           widget.indexChanged(index);
//           setState(() {
//             selectedScreenIndex = index;
//           });
//         },
//         items: bottomNavList.mapIndexed((i, e) => getNavItem(e, i)).toList());
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:virualapi/constants/constant.dart';
// import 'package:virualapi/ui/home/home_controller.dart';

// import 'package:virualapi/utils/metrics.dart';
// import 'package:collection/collection.dart';

// class BottomNavBar extends StatefulWidget {
//   final void Function(int index) indexChanged;
//   BottomNavBar({super.key, required this.indexChanged});

//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   int selectedScreenIndex = 0;

//   final selectedItemColor = COLOR_PRIMARY;
//   final unselectedItemColor = Colors.grey;

//   isSelected(index) => selectedScreenIndex == index;

//   getColor(index) =>
//       isSelected(index) ? selectedItemColor : unselectedItemColor;

//   BottomNavigationBarItem getNavItem(item, index) => BottomNavigationBarItem(
//         label: item["title"],
//         icon: Image.asset(
//           "assets/images/${item['icon']}",
//           width: getScreenWidth(context) * (index != 1 ? 0.074 : 0.1),
//           height: getScreenHeight(context) * 0.05,
//           color: getColor(index),
//           fit: BoxFit.scaleDown,
//         ),
//       );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Handle search action
//           // widget.indexChanged(1);
//           print("helllo");
//         },
//         backgroundColor: COLOR_PRIMARY,
//         child: Icon(Icons.search, color: Colors.white),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       backgroundColor: Colors.white,
//       bottomNavigationBar: ClipRRect(
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20), topRight: Radius.circular(20)),
//         child: BottomAppBar(
//           shape: CircularNotchedRectangle(),
//           color: Colors.blueGrey,
//           notchMargin: 8.0,
//           clipBehavior: Clip.antiAlias,
//           child: BottomNavigationBar(
//             key: Get.find<HomeController>().bottomWidgetKey,
//             type: BottomNavigationBarType.fixed,
//             selectedItemColor: selectedItemColor,
//             unselectedItemColor: unselectedItemColor,
//             backgroundColor: Colors.white,
//             currentIndex: selectedScreenIndex,
//             onTap: (index) {
//               if (index != 1) {
//                 widget.indexChanged(index);
//                 setState(() {
//                   selectedScreenIndex = index;
//                 });
//               }
//             },
//             items:
//                 bottomNavList.mapIndexed((i, e) => getNavItem(e, i)).toList(),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/ui/home/home.dart';
import 'package:virualapi/ui/home/home_controller.dart';
import 'package:virualapi/ui/notification/notification.dart';
import 'package:virualapi/ui/person/person_search_controller.dart';
import 'package:virualapi/ui/profile/profile.dart';
import 'package:virualapi/ui/result/result.dart';
import 'package:virualapi/ui/support/support.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:collection/collection.dart';
import 'package:virualapi/widgets/text_field.dart';

class BottomNavBar extends StatefulWidget {
  final void Function(int index) indexChanged;

  const BottomNavBar({super.key, required this.indexChanged});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedScreenIndex = 0;

  // Colors for selected and unselected states
  final selectedItemColor = COLOR_PRIMARY;
  final unselectedItemColor = Colors.grey;

  // Helper methods
  bool isSelected(int index) => selectedScreenIndex == index;

  Color getColor(int index) =>
      isSelected(index) ? selectedItemColor : unselectedItemColor;

  BottomNavigationBarItem buildNavItem(Map<String, dynamic> item, int index) {
    return BottomNavigationBarItem(
      label: item["title"] as String,
      icon: Image.asset(
        "assets/images/${item['icon'] as String}",
        width: getScreenWidth(context) * (index != 1 ? 0.065 : 0.1),
        height: getScreenHeight(context) * 0.05,
        color: getColor(index),
        fit: BoxFit.scaleDown,
      ),
    );
  }

  /// coreect code
  ///
  // void _openSearchBottomSheet() {
  //   TextEditingController firstNameController = TextEditingController();
  //   TextEditingController lastNameController = TextEditingController();

  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true, // This is necessary for controlling the height
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  //     ),
  //     builder: (BuildContext context) {
  //       return Container(
  //         height:
  //             MediaQuery.of(context).size.height / 1.2, // Half screen height
  //         padding: const EdgeInsets.all(16.0),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             const Text(
  //               "Search",
  //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //             ),
  //             const SizedBox(height: 16),
  //             AppTextField(
  //               name: 'username',
  //               controller: firstNameController,
  //               showTitle: false,
  //               title: "Username",
  //               rectangleborder: true,
  //               placeholder: "Enter First Name",
  //               validator: FormBuilderValidators.compose([
  //                 FormBuilderValidators.required(),
  //               ]),
  //             ),
  //             const SizedBox(height: 16),
  //             AppTextField(
  //               name: 'username',
  //               controller: lastNameController,
  //               showTitle: false,
  //               title: "Username",
  //               rectangleborder: true,
  //               placeholder: "Enter Last Name",
  //               validator: FormBuilderValidators.compose([
  //                 FormBuilderValidators.required(),
  //               ]),
  //             ),
  //             const SizedBox(height: 20),
  //             ElevatedButton(
  //               style: ElevatedButton.styleFrom(
  //                 backgroundColor: COLOR_PRIMARY,
  //                 minimumSize: Size.fromHeight(50),
  //                 shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(10)),
  //               ),
  //               onPressed: () async {
  //                 // Assuming you have controllers for the text fields
  //                 String firstName = firstNameController.text;
  //                 String lastName = lastNameController.text;

  //                 print(firstName);

  //                 // Call the API
  //                 await _searchPerson(firstName, lastName);
  //               },
  //               child: const Text("Search"),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
  void _openSearchBottomSheet() {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    bool _isLoading = false; // To control the loading state

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,

      // This is necessary for controlling the height
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          // Use StatefulBuilder to manage the loading state in the modal
          builder: (context, setState) {
            return Container(
              height: MediaQuery.of(context).size.height /
                  1.2, // Half screen height
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Search",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  AppTextField(
                    name: 'username',
                    controller: firstNameController,
                    showTitle: false,
                    title: "Username",
                    rectangleborder: true,
                    placeholder: "Enter First Name",
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  const SizedBox(height: 16),
                  AppTextField(
                    name: 'username',
                    controller: lastNameController,
                    showTitle: false,
                    title: "Username",
                    rectangleborder: true,
                    placeholder: "Enter Last Name",
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  const SizedBox(height: 20),
                  // Show a CircularProgressIndicator if _isLoading is true
                  _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: COLOR_PRIMARY,
                            minimumSize: Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () async {
                            String firstName = firstNameController.text;
                            String lastName = lastNameController.text;

                            // Set loading to true when the search starts
                            setState(() {
                              _isLoading = true;
                            });

                            try {
                              // Call the API
                              await _searchPerson(firstName, lastName);
                            } catch (e) {
                              // Handle any errors here
                              print("Error during search: $e");
                            } finally {
                              // After the API call, set loading to false
                              if (context.mounted) {
                                setState(() {
                                  _isLoading = false;
                                });
                              }

                              // Close the bottom sheet safely
                              if (context.mounted) {
                                Navigator.pop(context);
                              }
                            }
                          },
                          child: const Text("Search"),
                        ),
                ],
              ),
            );
          },
        );
      },
    ).whenComplete(_onBottomSheetClosed);
  }

  void _onBottomSheetClosed() {
    print("Closed bottomsheet");
  }

  // Future<void> _searchPerson(String firstName, String lastName) async {
  //   final String apiUrl = 'https://api.galaxysearchapi.com/PersonSearch';

  //   // Combine all headers into a single map, including new headers
  //   final Map<String, String> headers = {
  //     'Galaxy-Ap-Password':
  //         '2397b0ba0f8a4ea0aaea17e781e11305', // Your API password or token
  //     'Galaxy-Search-Type': 'Person',
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json', // Specify the expected response format
  //     'Galaxy-Ap-Name':
  //         'ethosinv', // Custom header (your application name or identifier)
  //   };

  //   // The body of the request
  //   final Map<String, dynamic> requestBody = {
  //     'FirstName': firstName,
  //     'LastName': lastName,
  //   };

  //   // Log the request body for debugging
  //   print("Request Body: ${json.encode(requestBody)}");

  //   try {
  //     Dio dio = Dio();

  //     // Set the headers in the dio options
  //     dio.options.headers = headers;

  //     final response = await dio.post(
  //       apiUrl,
  //       data: requestBody,
  //     );

  //     if (response.statusCode == 200) {
  //       // Handle the successful response
  //       final data = response.data;
  //       print('Response data: $data');
  //     } else {
  //       // Log error details
  //       print('Error: ${response.statusCode}');
  //       print('Response data: ${response.data}'); // More detailed error info
  //     }
  //   } catch (e) {
  //     // Handle and log error
  //     if (e is DioException) {
  //       print('Error making API call: ${e.message}');
  //       if (e.response != null) {
  //         print('Error response: ${e.response!.data}');
  //       }
  //     } else {
  //       print('Unexpected error: $e');
  //     }
  //   }
  // }

  // Future<void> _searchPerson(String firstName, String lastName) async {
  //   final String apiUrl = 'https://api.galaxysearchapi.com/PersonSearch';

  //   // Combine all headers into a single map
  //   final Map<String, String> headers = {
  //     'Galaxy-Ap-Password': '2397b0ba0f8a4ea0aaea17e781e11305',
  //     'Galaxy-Search-Type': 'Person',
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Galaxy-Ap-Name': 'ethosinv',
  //   };

  //   // Request body
  //   final Map<String, dynamic> requestBody = {
  //     'FirstName': firstName,
  //     'LastName': lastName,
  //   };

  //   print("Request Body: ${json.encode(requestBody)}");

  //   try {
  //     Dio dio = Dio();
  //     dio.options.headers = headers;

  //     final response = await dio.post(
  //       apiUrl,
  //       data: requestBody,
  //     );

  //     if (response.statusCode == 200) {
  //       final data = response.data;

  //       // Extract metadata
  //       var counts = data['counts'];
  //       var smartSearchStatistics = data['smartSearchStatistics'];
  //       var criteriaType = data['criteriaType'];
  //       var pagination = data['pagination'];
  //       var totalRequestExecutionTimeMs = data['totalRequestExecutionTimeMs'];
  //       var requestId = data['requestId'];
  //       var requestType = data['requestType'];
  //       var requestTime = data['requestTime'];
  //       var isError = data['isError'];
  //       var error = data['error'];

  //       // Log metadata
  //       print('Counts: $counts');
  //       print('Smart Search Statistics: $smartSearchStatistics');
  //       print('Criteria Type: $criteriaType');
  //       print('Pagination: $pagination');
  //       print(
  //           'Total Request Execution Time (ms): $totalRequestExecutionTimeMs');
  //       print('Request ID: $requestId');
  //       print('Request Type: $requestType');
  //       print('Request Time: $requestTime');
  //       print('Is Error: $isError');
  //       print('Error: $error');

  //       // Check if the response contains persons
  //       if (data.containsKey('persons') && data['persons'] is List) {
  //         List<dynamic> persons = data['persons'];

  //         for (var person in persons) {
  //           // Extract person details
  //           var name = person['name'];
  //           var firstName = name?['firstName'] ?? 'Unknown';
  //           var lastName = name?['lastName'] ?? 'Unknown';
  //           var rawNames = name?['rawNames']?.join(', ') ?? 'Unknown';
  //           var age = person['age']?.toString() ?? 'Unknown';
  //           var dobFirstSeen = person['dobFirstSeen'] ?? 'Unknown';
  //           var dobLastSeen = person['dobLastSeen'] ?? 'Unknown';
  //           var akas = person['akas'];

  //           // Log the extracted data
  //           print('Person: $firstName $lastName');
  //           print('Raw Names: $rawNames');
  //           print(
  //               'Details: Age - $age, DOB First Seen - $dobFirstSeen, DOB Last Seen - $dobLastSeen');

  //           // Log AKAs (if available)
  //           if (akas != null && akas is List) {
  //             for (var aka in akas) {
  //               var akaFirstName = aka['firstName'] ?? 'Unknown';
  //               var akaLastName = aka['lastName'] ?? 'Unknown';
  //               var akaRawNames = aka['rawNames']?.join(', ') ?? 'Unknown';
  //               print('AKA: $akaFirstName $akaLastName');
  //               print('AKA Raw Names: $akaRawNames');
  //             }
  //           }
  //           print('----------------------------');
  //         }
  //       } else {
  //         print('No persons found in the response.');
  //       }
  //     } else {
  //       print('Error: ${response.statusCode}');
  //       print('Response data: ${response.data}');
  //     }
  //   } catch (e) {
  //     if (e is DioException) {
  //       print('DioException occurred: ${e.message}');
  //       if (e.response != null) {
  //         print('Error response: ${e.response!.data}');
  //       }
  //     } else {
  //       print('Unexpected error: $e');
  //     }
  //   }
  // }

  Future<void> _searchPerson(String firstName, String lastName) async {
    final String apiUrl = 'https://api.galaxysearchapi.com/PersonSearch';
    final Map<String, String> headers = {
      'Galaxy-Ap-Password': '2397b0ba0f8a4ea0aaea17e781e11305',
      'Galaxy-Search-Type': 'Person',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Galaxy-Ap-Name': 'ethosinv',
    };
    final Map<String, dynamic> requestBody = {
      'FirstName': firstName,
      'LastName': lastName,
    };

    try {
      Dio dio = Dio();
      dio.options.headers = headers;

      final response = await dio.post(
        apiUrl,
        data: requestBody,
      );

      if (response.statusCode == 200) {
        final data = response.data;

        // Extract response data
        var persons = data['persons'] ?? [];
        var counts = data['counts'] ?? {};
        var pagination = data['pagination'] ?? {};

        // Navigate to the result screen with the data
        Get.to(
          ResultScreen(),
          arguments: {
            'persons': persons,
            'counts': counts,
            'pagination': pagination,
          },
        );
      } else {
        print('Error: ${response.statusCode}');
        print('Response data: ${response.data}');
      }
    } catch (e) {
      if (e is DioException) {
        print('DioException occurred: ${e.message}');
        if (e.response != null) {
          print('Error response: ${e.response!.data}');
        }
      } else {
        print('Unexpected error: $e');
      }
    }
  }

  List<Widget> pages = [
    // HomeDataScreen(),
    // Treatments(),
    // MedicationScreen(),
    // LabReportScreen(),
    Home(),
    NotificationScreen(),
    Support(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedScreenIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: _openSearchBottomSheet,
        backgroundColor: COLOR_PRIMARY,
        child: const Icon(Icons.search, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: Colors.white,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: Colors.blueGrey,
          notchMargin: 8.0,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            key: Get.find<HomeController>().bottomWidgetKey,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: selectedItemColor,
            unselectedItemColor: unselectedItemColor,
            backgroundColor: Colors.white,
            currentIndex: selectedScreenIndex,
            onTap: (index) {
              // Skip index 1 (notifications) if the user taps on it
              widget.indexChanged(index); // No condition to skip index 1
              setState(() {
                selectedScreenIndex = index;
              });
            },
            items: bottomNavList
                .mapIndexed((i, e) => buildNavItem(e, i))
                .toList()
                .cast<BottomNavigationBarItem>(),
          ),
        ),
      ),
    );
  }
}

// import 'package:collection/collection.dart';
// import 'package:flutter/material.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:get/get.dart';
// import 'package:virualapi/constants/constant.dart';
// import 'package:virualapi/ui/home/home.dart';
// import 'package:virualapi/ui/home/home_controller.dart';
// import 'package:virualapi/ui/notification/notification.dart';
// import 'package:virualapi/ui/support/support.dart';
// import 'package:virualapi/ui/profile/profile.dart';
// import 'package:virualapi/utils/metrics.dart';
// import 'package:virualapi/widgets/text_field.dart';
// import 'package:virualapi/ui/person/person_search_controller.dart';

// class BottomNavBar extends StatefulWidget {
//   final void Function(int index) indexChanged;

//   const BottomNavBar({super.key, required this.indexChanged});

//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   int selectedScreenIndex = 0;
//   final PersonSearchController personSearchController =
//       Get.find(); // Getting the controller

//   // Colors for selected and unselected states
//   final selectedItemColor = COLOR_PRIMARY;
//   final unselectedItemColor = Colors.grey;

//   bool isSelected(int index) => selectedScreenIndex == index;

//   Color getColor(int index) =>
//       isSelected(index) ? selectedItemColor : unselectedItemColor;

//   BottomNavigationBarItem buildNavItem(Map<String, dynamic> item, int index) {
//     return BottomNavigationBarItem(
//       label: item["title"] as String,
//       icon: Image.asset(
//         "assets/images/${item['icon'] as String}",
//         width: getScreenWidth(context) * (index != 1 ? 0.065 : 0.1),
//         height: getScreenHeight(context) * 0.05,
//         color: getColor(index),
//         fit: BoxFit.scaleDown,
//       ),
//     );
//   }

//   List<Widget> pages = [Home(), NotificationScreen(), Support(), Profile()];

//   // Bottom Sheet for Search
//   void _openSearchBottomSheet(BuildContext context) {
//     TextEditingController firstNameController = TextEditingController();
//     TextEditingController lastNameController = TextEditingController();

//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true, // This is necessary for controlling the height
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (BuildContext context) {
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text(
//                 "Search by Name",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               AppTextField(
//                 name: 'first_name',
//                 controller: firstNameController,
//                 showTitle: false,
//                 title: "First Name",
//                 rectangleborder: true,
//                 placeholder: "Enter First Name",
//                 validator: FormBuilderValidators.compose([
//                   FormBuilderValidators.required(),
//                 ]),
//               ),
//               const SizedBox(height: 16),
//               AppTextField(
//                 name: 'last_name',
//                 controller: lastNameController,
//                 showTitle: false,
//                 title: "Last Name",
//                 rectangleborder: true,
//                 placeholder: "Enter Last Name",
//                 validator: FormBuilderValidators.compose([
//                   FormBuilderValidators.required(),
//                 ]),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: COLOR_PRIMARY,
//                     minimumSize: Size.fromHeight(50),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10))),
//                 onPressed: () {
//                   // Use the controller to perform the search
//                   personSearchController.setSearchTerm(
//                     firstName: firstNameController.text,
//                     lastName: lastNameController.text,
//                   );
//                   Get.back(); // Close the modal after search
//                 },
//                 child: const Text("Search"),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[selectedScreenIndex],
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _openSearchBottomSheet(context); // Open bottom sheet on button press
//         },
//         backgroundColor: COLOR_PRIMARY,
//         child: const Icon(Icons.search, color: Colors.white),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       backgroundColor: Colors.white,
//       bottomNavigationBar: ClipRRect(
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(20),
//           topRight: Radius.circular(20),
//         ),
//         child: BottomAppBar(
//           shape: const CircularNotchedRectangle(),
//           color: Colors.blueGrey,
//           notchMargin: 8.0,
//           clipBehavior: Clip.antiAlias,
//           child: BottomNavigationBar(
//             key: Get.find<HomeController>().bottomWidgetKey,
//             type: BottomNavigationBarType.fixed,
//             selectedItemColor: selectedItemColor,
//             unselectedItemColor: unselectedItemColor,
//             backgroundColor: Colors.white,
//             currentIndex: selectedScreenIndex,
//             onTap: (index) {
//               widget.indexChanged(index);
//               setState(() {
//                 selectedScreenIndex = index;
//               });
//             },
//             items: bottomNavList
//                 .mapIndexed((i, e) => buildNavItem(e, i))
//                 .toList()
//                 .cast<BottomNavigationBarItem>(),
//           ),
//         ),
//       ),
//     );
//   }
// }
