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
  final bool showBottomBar;
  const BottomNavBar(
      {super.key, required this.indexChanged, this.showBottomBar = true});

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

  void _openSearchBottomSheet() {
    // Declare the controllers
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController addressController = TextEditingController();

    bool _isLoading = false;
    int _selectedTab = 0; // 0 = Name, 1 = Email, 2 = Phone, 3 = Address

    void clearFields() {
      firstNameController.clear();
      lastNameController.clear();
      emailController.clear();
      phoneController.clear();
      addressController.clear();
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: MediaQuery.of(context).size.height / 1.2,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Search",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),

                  // Tabs for different search types
                  DefaultTabController(
                    length: 4,
                    initialIndex: _selectedTab,
                    child: Column(
                      children: [
                        TabBar(
                          onTap: (index) =>
                              setState(() => _selectedTab = index),
                          tabs: const [
                            Tab(text: "By Name"),
                            Tab(text: "By Email"),
                            Tab(text: "By Phone"),
                            Tab(text: "By Address"),
                          ],
                          labelStyle: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: COLOR_PRIMARY,
                          ),
                          unselectedLabelStyle: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                          indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(
                              color:
                                  COLOR_PRIMARY, // Set the indicator color here
                              width: 10, // Adjust the thickness of the line
                            ),
                            borderRadius: BorderRadius.circular(
                                20), // Rounded corners for the indicator
                          ),
                          indicatorSize: TabBarIndicatorSize
                              .label, // Matches the indicator to the label's width
                        ),

                        const SizedBox(height: 15),

                        // Input fields based on selected tab
                        if (_selectedTab == 0)
                          Column(
                            children: [
                              AppTextField(
                                name: 'FirstName',
                                controller: firstNameController,
                                showTitle: false,
                                title: "First Name",
                                rectangleborder: true,
                                placeholder: "Enter First Name",
                                validator: FormBuilderValidators.required(),
                              ),
                              const SizedBox(height: 16),
                              AppTextField(
                                name: 'LastName',
                                controller: lastNameController,
                                showTitle: false,
                                title: "Last Name",
                                rectangleborder: true,
                                placeholder: "Enter Last Name",
                                validator: FormBuilderValidators.required(),
                              ),
                            ],
                          ),
                        if (_selectedTab == 1)
                          AppTextField(
                            name: 'email',
                            controller: emailController,
                            showTitle: false,
                            title: "Email",
                            rectangleborder: true,
                            placeholder: "Enter Email",
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.email(),
                            ]),
                          ),
                        if (_selectedTab == 2)
                          AppTextField(
                            name: 'phone',
                            controller: phoneController,
                            showTitle: false,
                            title: "Phone",
                            rectangleborder: true,
                            placeholder: "Enter Phone Number",
                            validator: FormBuilderValidators.required(),
                          ),
                        if (_selectedTab == 3)
                          AppTextField(
                            name: 'address',
                            controller: addressController,
                            showTitle: false,
                            title: "Address",
                            rectangleborder: true,
                            placeholder: "Enter Address",
                            validator: FormBuilderValidators.required(),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: COLOR_PRIMARY,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () async {
                            setState(() => _isLoading = true);

                            if (_selectedTab == 0) {
                              await searchByName(firstNameController.text,
                                  lastNameController.text);
                            } else if (_selectedTab == 1) {
                              await searchByEmail(emailController.text);
                            } else if (_selectedTab == 2) {
                              await searchByPhone(phoneController.text);
                            } else if (_selectedTab == 3) {
                              await searchByAddress(addressController.text);
                            }

                            clearFields();

                            // Avoid using the context immediately after an async operation
                            setState(() {
                              _isLoading = false;
                            });

                            // Ensure that the context is valid after the async operation
                            Future.delayed(Duration.zero, () {
                              if (!_isLoading) {
                                Navigator.of(context)
                                    .pop(); // This closes the bottom sheet
                                print(
                                    "closeddddddddddd"); // This confirms the bottom sheet closure
                              }
                            });
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

  int currentPage = 1;
  final int resultsPerPage = 10;
  bool hasNextPage = true;

  Future<void> searchByName(String firstName, String lastName,
      {bool isNextPage = false}) async {
    final String apiUrl = 'https://api.galaxysearchapi.com/PersonSearch';

    final Map<String, String> headers = {
      'Galaxy-Ap-Password': '2397b0ba0f8a4ea0aaea17e781e11305',
      'Galaxy-Search-Type': 'Person',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Galaxy-Ap-Name': 'ethosinv',
    };

    // Adjust the page number
    if (isNextPage) {
      currentPage++;
    } else if (currentPage > 1) {
      currentPage--;
    }

    final Map<String, dynamic> requestBody = {
      'FirstName': firstName,
      'LastName': lastName,
      'Page': currentPage,
      'ResultsPerPage': resultsPerPage,
    };

    try {
      Dio dio = Dio();
      dio.options.headers = headers;

      final response = await dio.post(apiUrl, data: requestBody);

      if (response.statusCode == 200) {
        final data = response.data;
        var persons = data['persons'] as List<dynamic>? ?? [];

        // Check if there are more pages
        hasNextPage = persons.length == resultsPerPage;

        if (persons.isEmpty) {
          print('No more results.');
        } else {
          var result = await Get.to(() => ResultScreen(), arguments: {
            'persons': persons,
            'currentPage': currentPage,
            'hasNextPage': hasNextPage,
          });

          // Ensure result is not null before accessing its properties
          if (result != null) {
            if (result['loadNextPage'] == true) {
              searchByName(firstName, lastName, isNextPage: true);
            } else if (result['loadPreviousPage'] == true) {
              searchByName(firstName, lastName, isNextPage: false);
            }
          }
        }
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Unexpected error: $e');
    }
  }

// Common function for email, phone, and address search
  Future<void> searchByField(String fieldType, String fieldValue) async {
    final Map<String, dynamic> requestBody = {
      fieldType: fieldValue,
      'Page': currentPage,
      'ResultsPerPage': resultsPerPage,
    };

    final String apiUrl = 'https://api.galaxysearchapi.com/PersonSearch';
    final Map<String, String> headers = {
      'Galaxy-Ap-Password': '2397b0ba0f8a4ea0aaea17e781e11305',
      'Galaxy-Search-Type': 'Person',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Galaxy-Ap-Name': 'ethosinv',
    };

    try {
      Dio dio = Dio();
      dio.options.headers = headers;
      final response = await dio.post(apiUrl, data: requestBody);

      if (response.statusCode == 200) {
        final data = response.data;
        var persons = data['persons'] as List<dynamic>? ?? [];

        // Check if there are more pages
        hasNextPage = persons.length == resultsPerPage;

        if (persons.isNotEmpty) {
          Get.to(() => ResultScreen(), arguments: {
            'persons': persons,
            'currentPage': currentPage,
            'hasNextPage': hasNextPage,
          });
        } else {
          print('No results found.');
        }
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Unexpected error: $e');
    }
  }

  Future<void> searchByEmail(String email) async {
    await searchByField('Email', email);
  }

  Future<void> searchByPhone(String phone) async {
    await searchByField('Phone', phone);
  }

  Future<void> searchByAddress(String address) async {
    await searchByField('Address', address);
  }

  void _onBottomSheetClosed() {
    print("Bottom sheet closed.");
  }

  final List<GlobalKey<NavigatorState>> navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

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

  void indexChanged(int index) {
    setState(() {
      selectedScreenIndex = index;
    });
    widget.indexChanged(index);
  }

  void _onItemTapped(int index) {
    if (navigatorKeys[index].currentState!.canPop()) {
      navigatorKeys[index].currentState!.popUntil((route) => route.isFirst);
    } else {
      indexChanged(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: IndexedStack(
            index: selectedScreenIndex,
            children: List.generate(
              pages.length,
              (index) {
                return Navigator(
                  key: navigatorKeys[index],
                  onGenerateRoute: (routeSettings) {
                    // Return a MaterialPageRoute for each tab's screen
                    return MaterialPageRoute(
                      builder: (context) => pages[index],
                    );
                  },
                );
              },
            ),
          ),
        ),
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
            notchMargin: 8.0,
            clipBehavior: Clip.antiAlias,
            height: 100,
            child: BottomNavigationBar(
              key: Get.find<HomeController>().bottomWidgetKey,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: selectedItemColor,
              unselectedItemColor: unselectedItemColor,
              backgroundColor: Colors.white,
              currentIndex: selectedScreenIndex,
              onTap: _onItemTapped,
              items: bottomNavList
                  .mapIndexed((i, e) => buildNavItem(e, i))
                  .toList()
                  .cast<BottomNavigationBarItem>(),
            ),
          ),
        ));
  }
}
