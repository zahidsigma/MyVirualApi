// import 'package:get/get.dart';
// import 'package:virualapi/core/routing/router_str.dart';
// import 'package:virualapi/repos/misc_repo.dart';
// import 'package:virualapi/utils/snackbar_util.dart';

// class PersonSearchController extends GetxController {
//   PersonSearchController();
//   RxBool isBusy = false.obs;
//   final _miscRepo = Get.find<MiscRepository>();
//   RxList<Map<String, dynamic>> dataList = RxList();

//   @override
//   void onInit() {
//     super.onInit();
//     getPersonSearch();
//   }

//   getPersonSearch() async {
//     isBusy.value = true;

//     var result = await _miscRepo.getPersonSearch();
//     isBusy.value = false;

//     result.fold((failure) {
//       SnackbarUtil.error(
//         logMessage: (failure as Error).errorMessage.toString(),
//         logScreenName: Routers.personSearch,
//         logMethodName: 'getPayments',
//         message: (failure).errorMessage.toString(),
//       );
//     }, (r) {
//       dataList.value = r.reversed.toList();
//     });
//   }
// }

// extension on Error {
//   get errorMessage => null;
// }

// import 'package:get/get.dart';
// import 'package:virualapi/repos/misc_repo.dart';
// import 'package:virualapi/core/routing/router_str.dart';
// import 'package:virualapi/utils/snackbar_util.dart';
// import 'package:dartz/dartz.dart';

// class PersonSearchController extends GetxController {
//   final RxBool isBusy = false.obs;
//   final _miscRepo = Get.find<MiscRepository>();
//   RxList<Map<String, dynamic>> dataList = RxList();
//   RxBool hasMore = true.obs; // To check if there are more results
//   int currentPage = 1; // Track the current page

//   @override
//   void onInit() {
//     super.onInit();
//     getPersonSearch(); // Load the initial data
//   }

//   // Function to fetch person search results with pagination
//   Future<void> getPersonSearch({int page = 1, int size = 10}) async {
//     isBusy.value = true; // Set loading state to true

//     // Call repository to get data
//     final result = await _miscRepo.getPersonSearch(page: page, size: size);

//     isBusy.value = false; // Set loading state to false

//     result.fold(
//       (failure) {
//         // Handle error: Show snackbar
//         SnackbarUtil.error(
//           logMessage: failure.errorMessage,
//           logScreenName: Routers.personSearch,
//           logMethodName: 'getPersonSearch',
//           message: failure.errorMessage,
//         );
//       },
//       (data) {
//         if (data.isEmpty) {
//           hasMore.value = false; // No more data to load
//         } else {
//           if (page == 1) {
//             dataList.value = data; // If it's the first page, replace the data
//           } else {
//             dataList.addAll(data); // Otherwise, append new data to the list
//           }
//         }
//       },
//     );
//   }

//   // Function to load more data when user reaches the end
//   Future<void> loadMoreData() async {
//     if (isBusy.value || !hasMore.value) {
//       return; // Prevent loading if already busy or no more data
//     }

//     currentPage++; // Increment the page number
//     await getPersonSearch(page: currentPage); // Fetch the next page
//   }
// }

// import 'package:get/get.dart';
// import 'package:virualapi/repos/misc_repo.dart';
// import 'package:virualapi/core/routing/router_str.dart';
// import 'package:virualapi/utils/snackbar_util.dart';
// import 'package:dartz/dartz.dart';

// class PersonSearchController extends GetxController {
//   final RxBool isBusy = false.obs;
//   final _miscRepo = Get.find<MiscRepository>();
//   RxList<Map<String, dynamic>> dataList = RxList();
//   RxBool hasMore = true.obs;
//   int currentPage = 1;

//   // Optional search term for first name or last name
//   String searchTerm = "";

//   @override
//   void onInit() {
//     super.onInit();
//     getPersonSearch(); // Load the initial data
//   }

//   // Function to fetch person search results with pagination
//   Future<void> getPersonSearch(
//       {int page = 1, int size = 10, String search = ""}) async {
//     isBusy.value = true;

//     // Pass the search term to the repository
//     final result = await _miscRepo.getPersonSearch(
//         page: page, size: size, searchTerm: search);

//     isBusy.value = false;

//     result.fold(
//       (failure) {
//         SnackbarUtil.error(
//           logMessage: failure.errorMessage,
//           logScreenName: Routers.personSearch,
//           logMethodName: 'getPersonSearch',
//           message: failure.errorMessage,
//         );
//       },
//       (data) {
//         if (data.isEmpty) {
//           hasMore.value = false;
//         } else {
//           if (page == 1) {
//             dataList.value = data;
//           } else {
//             dataList.addAll(data);
//           }
//         }
//       },
//     );
//   }

//   // Function to set search term and refresh the data
//   void setSearchTerm(String term) {
//     searchTerm = term;
//     currentPage = 1; // Reset to the first page
//     hasMore.value = true; // Reset to ensure pagination works properly
//     getPersonSearch(
//         page: currentPage,
//         search: searchTerm); // Fetch data with the new search term
//   }

//   Future<void> loadMoreData() async {
//     if (isBusy.value || !hasMore.value) {
//       return;
//     }

//     currentPage++;
//     await getPersonSearch(
//         page: currentPage,
//         search: searchTerm); // Fetch the next page with search term
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virualapi/repos/misc_repo.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/utils/snackbar_util.dart';
import 'package:dartz/dartz.dart';

class PersonSearchController extends GetxController {
  final RxBool isBusy = false.obs;
  final _miscRepo = Get.find<MiscRepository>();
  RxList<Map<String, dynamic>> dataList = RxList();
  RxBool hasMore = true.obs;
  int currentPage = 1;

  // Optional search term for first name or last name
  String searchTerm = "";

  @override
  void onInit() {
    super.onInit();
    getPersonSearch(); // Load the initial data
  }

  // Function to fetch person search results with pagination
  Future<void> getPersonSearch(
      {int page = 1, int size = 10, String search = ""}) async {
    isBusy.value = true;

    // Pass the search term to the repository
    final result = await _miscRepo.getPersonSearch(
        page: page, size: size, searchTerm: search);

    isBusy.value = false;

    result.fold(
      (failure) {
        SnackbarUtil.error(
          logMessage: failure.errorMessage,
          logScreenName: Routers.personSearch,
          logMethodName: 'getPersonSearch',
          message: failure.errorMessage,
        );
      },
      (data) {
        if (data.isEmpty) {
          hasMore.value = false;
        } else {
          if (page == 1) {
            dataList.value = data;
          } else {
            dataList.addAll(data);
          }
        }
      },
    );
  }

  // Function to set search term and refresh the data
  void setSearchTerm({required String firstName, required String lastName}) {
    // Ensure that either first name or last name is provided
    if (firstName.isEmpty && lastName.isEmpty) {
      SnackbarUtil.error(
        logMessage: 'First name or last name is required',
        logScreenName: Routers.personSearch,
        logMethodName: 'setSearchTerm',
        message: 'Please enter at least one: first name or last name.',
      );
      return; // Do not proceed if no name is provided
    }

    // Combine first name and last name to form search term
    searchTerm = "$firstName $lastName";

    currentPage = 1; // Reset to the first page
    hasMore.value = true; // Reset to ensure pagination works properly
    getPersonSearch(
        page: currentPage,
        search: searchTerm); // Fetch data with the new search term
  }

  // Function to open the bottom modal sheet to get first and last name
  void showSearchModal() {
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Search by Name",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  // Store first name input
                  searchTerm = value;
                },
                decoration: InputDecoration(
                  labelText: "First Name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  // Store last name input
                  searchTerm = value;
                },
                decoration: InputDecoration(
                  labelText: "Last Name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Call setSearchTerm when user submits
                  setSearchTerm(
                    firstName: searchTerm
                        .split(' ')[0], // Get first part as first name
                    lastName: searchTerm.split(' ').length > 1
                        ? searchTerm
                            .split(' ')[1] // Get second part as last name
                        : "",
                  );
                  Get.back(); // Close the modal
                },
                child: Text("Search"),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> loadMoreData() async {
    if (isBusy.value || !hasMore.value) {
      return;
    }

    currentPage++;
    await getPersonSearch(
        page: currentPage,
        search: searchTerm); // Fetch the next page with search term
  }
}
