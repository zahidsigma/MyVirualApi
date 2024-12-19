import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map;
    final persons = arguments['persons'] as List;
    final counts = arguments['counts'] as Map;
    final pagination = arguments['pagination'] as Map;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Results"),
        backgroundColor: COLOR_PRIMARY,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Total Persons Found: ${counts['totalPersons'] ?? 0}"),
            const SizedBox(height: 8),
            Text("Current Page: ${pagination['currentPage'] ?? 1}"),
            Text("Total Pages: ${pagination['totalPages'] ?? 1}"),
            const Divider(),
            const Text(
              "Persons:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            persons.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: persons.length,
                    itemBuilder: (context, index) {
                      final person = persons[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        color: COLOR_ACCENT,
                        shape: RoundedRectangleBorder(),
                        elevation: 10.0,
                        child: ListTile(
                          title: Text("Name: ${person["fullName"] ?? ""}",
                              style: TextStyle(color: COLOR_PRIMARY)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Age: ${person['age'] ?? ''}",
                                  style: TextStyle(color: Colors.black)),
                              const SizedBox(height: 2),
                              // Text("Addresses:"),
                              Text(
                                "Address: ${person['addresses'][0]["fullAddress"].toString() ?? ''}",
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                "Phone No : ${person['phoneNumbers'][0]["phoneNumber"].toString() ?? ''}",
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                "Company Name : ${person['phoneNumbers'][0]["company"].toString() ?? ''}",
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                "Email Address : ${person['emailAddresses'][0]["emailAddress"].toString() ?? ''}",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : const Text("No persons found."),
          ],
        ),
      ),
    );
  }
}
