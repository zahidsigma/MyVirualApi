import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/services/app_preferences.dart';
import 'package:virualapi/ui/result/result.dart';
import 'package:virualapi/widgets/custom_Header.dart';
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
  late TextEditingController phoneController;
  late TextEditingController addressController;
  TextEditingController middleNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressControllerAddone = TextEditingController();
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
    phoneController = TextEditingController(text: args["phone"] ?? "");
    addressController = TextEditingController(text: args["address"] ?? "");
  }

  @override
  void dispose() {
    _pageController.dispose(); // ✅ Dispose PageController
    firstNameController.dispose();
    lastNameController.dispose();
    middleNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    ageController.dispose();
    addressController.dispose();
    addressControllerAddone.dispose();
    super.dispose();
  }

  void printAllFields() {
    print("First Name: ${firstNameController.text}");
    print("Last Name: ${lastNameController.text}");
    print("Email: ${emailController.text}");
    print("phone: ${phoneController.text}");
    print("Middle Name: ${middleNameController.text}");
    print("Age: ${ageController.text}");
    print("Address: ${addressControllerAddone.text}");
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
  int resultsPerPage = 300; // ✅ Define results per page
  bool hasNextPage = false;

  Future<void> searchByName({bool isNextPage = false}) async {
    final token = AppPreferences.getAuthToken();
    final String apiUrl =
        "https://server.testlinkwebsitespace.com/virtual-pi-backend/public/api/search-records";

    // final Map<String, String> headers = {
    //   'Galaxy-Ap-Password': '2397b0ba0f8a4ea0aaea17e781e11305',
    //   'Galaxy-Search-Type': 'Person',
    //   'Content-Type': 'application/json',
    //   'Accept': 'application/json',
    //   'Galaxy-Ap-Name': 'ethosinv',
    // };

    final Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
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
      'Phone': phoneController.text.trim(),
      "Addresses": [
        {
          "AddressLine2": addressController.text.trim(),
        }
      ],
      // "Dob": dobthController.text.trim(),
      'Page': currentPage,
      // 'ResultsPerPage': resultsPerPage,

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
      // appBar: AppBar(
      //   title: Text("Enter Details"),
      //   backgroundColor: COLOR_PRIMARY,
      // ),
      body: Stack(
        children: [
          Column(
            children: [
              CustomHeader(
                title: "Enter Details",
                onBackPressed: () {
                  print("Back pressed");
                  Navigator.of(context).pop();
                },
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    buildTextFieldPage(middleNameController, "Middle Name",
                        "Did you Know Middle Name?"),
                    buildTextFieldPage(
                        ageController, "Age", "Did You Know Age?",
                        isNumber: true),
                    buildTextFieldPage(addressControllerAddone,
                        "Address (Optional)", "Did You Know Address?"),
                    buildTextFieldPage(
                        dobthController,
                        "Date Of Birth (Optional format 1/1/1980)",
                        "Did You Know Date of Birth?"),
                    buildTextFieldPage(stateController, "State (Optional)",
                        "Did You Know State?"),
                    buildTextFieldPage(cityController, "City (Optional)",
                        "Did You Know City?"),
                  ],
                ),
              ),
              buildNavigationButtons(),
            ],
          ),
          if (_isLoading) // Show overlay only when loading
            Positioned.fill(
              child: AbsorbPointer(
                absorbing: true,
                child: Container(
                  color: Colors.black
                      .withOpacity(0.3), // semi-transparent dark overlay
                  child: Center(
                    child: CircularProgressIndicator(
                      color: DARK_BG_COLOR,
                    ),
                  ),
                ),
              ),
            ),
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
            ElevatedButton(
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

  // Widget buildNavigationButtons() {
  //   return Padding(
  //     padding: const EdgeInsets.all(16.0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         ElevatedButton(
  //           style: ElevatedButton.styleFrom(
  //             backgroundColor: COLOR_PRIMARY,
  //           ),
  //           onPressed: (_currentPage > 0 && _currentPage < 5)
  //               ? previousPage
  //               : null, // disabled if currentPage == 5
  //           child: Text("Previous"),
  //         ),
  //         if (_currentPage < 5)
  //           ElevatedButton(
  //             style: ElevatedButton.styleFrom(
  //               backgroundColor: COLOR_PRIMARY,
  //             ),
  //             onPressed: nextPage,
  //             child: Text("Next"),
  //           ),
  //         if (_currentPage == 5)
  //           ElevatedButton(
  //             style: ElevatedButton.styleFrom(
  //               backgroundColor: COLOR_PRIMARY,
  //             ),
  //             onPressed: searchByName,
  //             child: Text("Submit"),
  //           ),
  //       ],
  //     ),
  //   );
  // }
}
