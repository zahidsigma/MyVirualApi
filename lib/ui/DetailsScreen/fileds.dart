// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:virualapi/constants/constant.dart';
// import 'dart:convert';

// import 'package:virualapi/widgets/text_field.dart';

// class FieldsScreen extends StatefulWidget {
//   @override
//   _FieldsScreenState createState() => _FieldsScreenState();
// }

// class _FieldsScreenState extends State<FieldsScreen> {
//   late TextEditingController firstNameController;
//   late TextEditingController lastNameController;
//   TextEditingController middleNameController = TextEditingController();
//   TextEditingController ageController = TextEditingController();
//   TextEditingController addressController = TextEditingController();

//   bool _isLoading = false;

//   @override
//   void initState() {
//     super.initState();

//     // Retrieve only firstName and lastName from GetX arguments
//     final args = Get.arguments ?? {};
//     firstNameController = TextEditingController(text: args["firstName"] ?? "");
//     lastNameController = TextEditingController(text: args["lastName"] ?? "");
//   }

//   @override
//   void dispose() {
//     firstNameController.dispose();
//     lastNameController.dispose();
//     middleNameController.dispose();
//     ageController.dispose();
//     addressController.dispose();
//     super.dispose();
//   }

//   void printFields() {
//     print("First Name: ${firstNameController.text}");
//     print("Last Name: ${lastNameController.text}");
//     print(
//         "Middle Name: ${middleNameController.text.isNotEmpty ? middleNameController.text : "Not provided"}");
//     print(
//         "Age: ${ageController.text.isNotEmpty ? ageController.text : "Not provided"}");
//     print(
//         "Address: ${addressController.text.isNotEmpty ? addressController.text : "Not provided"}");
//   }

//   Future<void> sendDataToApi() async {
//     printFields(); // Print values before sending

//     const String apiUrl =
//         "https://your-api-endpoint.com/data"; // Replace with your API URL

//     final response = await http.post(
//       Uri.parse(apiUrl),
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode({
//         "firstName": firstNameController.text,
//         "lastName": lastNameController.text,
//         "middleName": middleNameController.text.isNotEmpty
//             ? middleNameController.text
//             : null,
//         "age": ageController.text.isNotEmpty
//             ? int.tryParse(ageController.text)
//             : null,
//         "address":
//             addressController.text.isNotEmpty ? addressController.text : null,
//       }),
//     );

//     if (response.statusCode == 200) {
//       Get.snackbar("Success", "Data sent successfully!");
//     } else {
//       Get.snackbar("Error", "Failed to send data");
//     }
//   }

//   void clearFields() {
//     middleNameController.clear();
//     ageController.clear();
//     addressController.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Enter Details")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             SizedBox(height: 20),
//             AppTextField(
//               name: 'MiddleName',
//               controller: middleNameController,
//               showTitle: false,
//               title: "Middle Name (Optional)",
//               rectangleborder: true,
//               placeholder: "Middle Name",
//             ),
//             SizedBox(height: 20),
//             AppTextField(
//               name: 'Age',
//               controller: ageController,
//               showTitle: false,
//               title: "Age (Optional)",
//               rectangleborder: true,
//               placeholder: "Age",
//               inputType: TextInputType.number,
//             ),
//             SizedBox(height: 20),
//             AppTextField(
//               name: 'Address',
//               controller: addressController,
//               showTitle: false,
//               title: "Address (Optional)",
//               rectangleborder: true,
//               placeholder: "Address",
//             ),
//             SizedBox(height: 20),
//             _isLoading
//                 ? const Center(child: CircularProgressIndicator())
//                 : ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor:
//                           COLOR_PRIMARY, // Change to your primary color
//                       minimumSize: const Size.fromHeight(50),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     onPressed: () async {
//                       setState(() => _isLoading = true);

//                       // Simulate a delay (for testing)
//                       await Future.delayed(Duration(seconds: 2));

//                       clearFields(); // Clear the text fields

//                       setState(() => _isLoading = false);

//                       Future.delayed(Duration.zero, () {
//                         if (!_isLoading) {
//                           Navigator.of(context).pop(); // Close bottom sheet
//                           print("Closed Bottom Sheet");
//                         }
//                       });
//                     },
//                     child: const Text("Search"),
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/ui/result/result.dart';
import 'dart:convert';

import 'package:virualapi/widgets/text_field.dart';

class FieldsScreen extends StatefulWidget {
  @override
  _FieldsScreenState createState() => _FieldsScreenState();
}

class _FieldsScreenState extends State<FieldsScreen> {
  late PageController _pageController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  TextEditingController middleNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dobthController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  bool _isLoading = false;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(); // ✅ Initialize PageController

    // Retrieve arguments from GetX
    final args = Get.arguments ?? {};
    firstNameController = TextEditingController(text: args["firstName"] ?? "");
    lastNameController = TextEditingController(text: args["lastName"] ?? "");
    emailController = TextEditingController(text: args["email"] ?? "");
  }

  @override
  void dispose() {
    _pageController.dispose(); // ✅ Dispose PageController
    firstNameController.dispose();
    lastNameController.dispose();
    middleNameController.dispose();
    emailController.dispose();
    ageController.dispose();
    addressController.dispose();
    super.dispose();
  }

  void printAllFields() {
    print("First Name: ${firstNameController.text}");
    print("Last Name: ${lastNameController.text}");
    print("Email: ${emailController.text}");
    print("Middle Name: ${middleNameController.text}");
    print("Age: ${ageController.text}");
    print("Address: ${addressController.text}");
  }

  void nextPage() {
    if (_currentPage < 5) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      setState(() => _currentPage++);
    }
  }

  void previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
      setState(() => _currentPage--);
    }
  }

  bool isLoading = false;
  int currentPage = 1;
  int resultsPerPage = 50; // ✅ Define results per page
  bool hasNextPage = false;

  // Future<void> searchByName({bool isNextPage = false}) async {
  //   final String apiUrl = 'https://api.galaxysearchapi.com/PersonSearch';

  //   final Map<String, String> headers = {
  //     'Galaxy-Ap-Password': '2397b0ba0f8a4ea0aaea17e781e11305',
  //     'Galaxy-Search-Type': 'Person',
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Galaxy-Ap-Name': 'ethosinv',
  //   };

  //   // ✅ Handle pagination
  //   if (isNextPage) {
  //     currentPage++;
  //   } else if (currentPage > 1) {
  //     currentPage--; // Ensure we don’t go below page 1
  //   }

  //   // ✅ Convert age safely
  //   // int age = int.tryParse(ageController.text) ?? 0;
  //   // int minAge = (age > 18) ? (age - 2) : 18;
  //   // int maxAge = (age < 98) ? (age + 2) : 100;
  //   int minAge = 18;
  //   int maxAge = 100;

  //   // ✅ Include all fields in API request
  //   final Map<String, dynamic> requestBody = {
  //     'FirstName': firstNameController.text.trim(),
  //     'MiddleName': middleNameController.text.trim(),
  //     'LastName': lastNameController.text.trim(),
  //     'Address': addressController.text.trim(),
  //     'Filters': {
  //       'AgeRange': {'Min': minAge, 'Max': maxAge}
  //     },
  //     'Pagination': {'Page': currentPage, 'ResultsPerPage': resultsPerPage}
  //   };

  //   try {
  //     setState(() => _isLoading = true);

  //     Dio dio = Dio();
  //     dio.options.headers = headers;

  //     print("📢 Sending API Request: $requestBody");

  //     final response = await dio.post(apiUrl, data: requestBody);

  //     if (response.statusCode == 200) {
  //       final data = response.data;
  //       var persons = data['persons'] as List<dynamic>? ?? [];

  //       // ✅ Determine if more pages exist
  //       hasNextPage = persons.length == resultsPerPage;

  //       if (persons.isEmpty) {
  //         print('❌ No more results.');
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text('❌ No results found!')),
  //         );
  //       } else {
  //         print("Sending to ResultScreen...");
  //         var firstName = firstNameController.text.trim();
  //         var lastName = lastNameController.text.trim();
  //         print("✔ First Name: $firstName");
  //         print("✔ Last Name: $lastName");
  //         // ✅ Navigate to ResultScreen & pass data
  //         var result = await Get.to(() => ResultScreen(), arguments: {
  //           'persons': persons,
  //           'currentPage': currentPage,
  //           'hasNextPage': hasNextPage,
  //           'minAge': minAge,
  //           'maxAge': maxAge,
  //           'FirstName': firstName,
  //           'LastName': lastName,
  //         });

  //         // ✅ Handle pagination from ResultScreen
  //         if (result != null) {
  //           if (result['loadNextPage'] == true) {
  //             searchByName(isNextPage: true);
  //           } else if (result['loadPreviousPage'] == true && currentPage > 1) {
  //             searchByName(isNextPage: false);
  //           }
  //         }
  //       }
  //     } else {
  //       print('❌ Error ${response.statusCode}: ${response.data}');
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('❌ Search Failed! Try Again.')),
  //       );
  //     }
  //   } catch (e) {
  //     print('🚨 Unexpected error: $e');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('🚨 Network Error! Check Connection.')),
  //     );
  //   } finally {
  //     setState(() => _isLoading = false);
  //   }
  // }

  Future<void> searchByName({bool isNextPage = false}) async {
    final String apiUrl = 'https://api.galaxysearchapi.com/PersonSearch';

    final Map<String, String> headers = {
      'Galaxy-Ap-Password': '2397b0ba0f8a4ea0aaea17e781e11305',
      'Galaxy-Search-Type': 'Person',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Galaxy-Ap-Name': 'ethosinv',
    };

    // ✅ Handle pagination
    if (isNextPage) {
      currentPage++;
    } else if (currentPage > 1) {
      currentPage--; // Ensure we don’t go below page 1
    }

    // ✅ Set age values
    int minAge = 18;
    int maxAge = 100;

    // ✅ Include all fields in API request
    final Map<String, dynamic> requestBody = {
      'FirstName': firstNameController.text.trim(),
      'MiddleName': middleNameController.text.trim(),
      'LastName': lastNameController.text.trim(),
      'Email': emailController.text.trim(),
      // "Addresses": [
      //   {
      //     "AddressLine2": addressController.text.trim(),
      //   }
      // ],
      // "Dob": dobthController.text.trim(),
      'Page': currentPage,
      'ResultsPerPage': resultsPerPage,

      'Filters': {
        'AgeRange': {'Min': minAge, 'Max': maxAge}
      },
      // 'Pagination': {
      //   'Page': currentPage,
      //   'ResultsPerPage': resultsPerPage,
      // }
    };

    try {
      setState(() => _isLoading = true);

      Dio dio = Dio();
      dio.options.headers = headers;

      print("📢 Sending API Request: $requestBody");

      final response = await dio.post(apiUrl, data: requestBody);

      if (response.statusCode == 200) {
        final data = response.data;
        var persons = data['persons'] as List<dynamic>? ?? [];

        // ✅ Determine if more pages exist based on 50 items per page
        hasNextPage = persons.length == resultsPerPage;

        if (persons.isEmpty) {
          print('❌ No more results.');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('❌ No results found!')),
          );
        } else {
          print("Sending to ResultScreen...");
          var firstName = firstNameController.text.trim();
          var lastName = lastNameController.text.trim();
          var email = emailController.text.trim();
          print("✔ First Name: $firstName");
          print("✔ Last Name: $lastName");
          // ✅ Navigate to ResultScreen & pass data
          var result = await Get.to(() => ResultScreen(), arguments: {
            'persons': persons,
            'currentPage': currentPage,
            'hasNextPage': hasNextPage,
            'minAge': minAge,
            'maxAge': maxAge,
            'FirstName': firstName,
            'LastName': lastName,
            'Email': email
          });

          // ✅ Handle pagination from ResultScreen
          if (result != null) {
            if (result['loadNextPage'] == true) {
              searchByName(isNextPage: true);
            } else if (result['loadPreviousPage'] == true && currentPage > 1) {
              searchByName(isNextPage: false);
            }
          }
        }
      } else {
        print('❌ Error ${response.statusCode}: ${response.data}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('❌ Search Failed! Try Again.')),
        );
      }
    } catch (e) {
      print('🚨 Unexpected error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('🚨 Network Error! Check Connection.')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter Details"),
        backgroundColor: COLOR_PRIMARY,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController, // ✅ Ensure controller is initialized
              physics: NeverScrollableScrollPhysics(),
              children: [
                // Each call must have title and subtitle
                buildTextFieldPage(middleNameController, "Middle Name",
                    "Did you Know Middle Name?"),
                buildTextFieldPage(ageController, "Age", "Did You Know Age?",
                    isNumber: true),
                buildTextFieldPage(
                    addressController, "Address ()", "Did You Know Address?"),
                buildTextFieldPage(
                    dobthController,
                    "Date Of Birth (Optional format 1/1/1980)",
                    "Did You Know Date of Birth?"),
                buildTextFieldPage(
                    stateController, "State (Optional)", "Did You Know State?"),

                buildTextFieldPage(
                    cityController, "City (Optional)", "Did You Know City?"),
              ],
            ),
          ),
          buildNavigationButtons(),
          // SizedBox(height: 20),
          // _isLoading
          //     ? CircularProgressIndicator() // ✅ Show loader while API is calling
          //     : ElevatedButton(
          //         onPressed: searchByName, // ✅ Call API when button is pressed
          //         child: Text("Submit & Search"),
          //       ),
        ],
      ),
    );
  }

  Widget buildTextFieldPage(
      TextEditingController controller, String title, String subtitle,
      {bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(subtitle,
              style: TextStyle(
                  fontSize: 20, fontFamily: "Poppins", color: COLOR_PRIMARY)),
          SizedBox(height: 20),
          AppTextField(
            name: title,
            controller: controller,
            showTitle: false,
            title: title,
            rectangleborder: true,
            placeholder: title,
            inputType: isNumber ? TextInputType.number : TextInputType.text,
          ),
        ],
      ),
    );
  }

  Widget buildNavigationButtons() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_currentPage > 0)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: COLOR_PRIMARY,
              ),
              onPressed: previousPage,
              child: Text("Previous"),
            ),
          if (_currentPage < 5)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: COLOR_PRIMARY,
              ),
              onPressed: nextPage,
              child: Text("Next"),
            ),
          if (_currentPage == 5)
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: COLOR_PRIMARY,
                    ),
                    onPressed: searchByName,
                    child: Text("Submit"),
                  ),
        ],
      ),
    );
  }
}
