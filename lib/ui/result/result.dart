// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ResultScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final Map<String, dynamic>? args = Get.arguments;
//     final List<dynamic> persons = args?['persons'] ?? [];
//     final int currentPage = args?['currentPage'] ?? 1;
//     final bool hasNextPage = args?['hasNextPage'] ?? false;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Search Results"),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: persons.isEmpty
//           ? const Center(child: Text("No results found"))
//           : ListView.builder(
//               itemCount: persons.length,
//               itemBuilder: (context, index) {
//                 var person = persons[index];

//                 var name = person['name'] ?? {};
//                 var firstName = name['firstName'] ?? 'Unknown';
//                 var lastName = name['lastName'] ?? 'Unknown';
//                 var emails = (person['emailAddresses'][0] as List<dynamic>?) ??
//                     'No email available';
//                 var phones =
//                     (person['phoneNumbers'] as List<dynamic>?)?.join(", ") ??
//                         'No phone available';
//                 var addresses =
//                     (person['addresses'] as List<dynamic>?)?.join(", ") ??
//                         'No address available';

//                 return Card(
//                   margin:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   elevation: 4,
//                   child: ListTile(
//                     title: Text("$firstName $lastName",
//                         style: const TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.bold)),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Email: $emails"),
//                         Text("Phone: $phones"),
//                         Text("Address: $addresses"),
//                       ],
//                     ),
//                     leading: const Icon(Icons.person, color: Colors.blue),
//                   ),
//                 );
//               },
//             ),
//       bottomNavigationBar: persons.isNotEmpty
//           ? Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     onPressed: currentPage > 1
//                         ? () {
//                             Get.back(result: {'loadPreviousPage': true});
//                           }
//                         : null,
//                     child: const Text("Previous"),
//                   ),
//                   Text("Page $currentPage"),
//                   ElevatedButton(
//                     onPressed: hasNextPage
//                         ? () {
//                             Get.back(result: {'loadNextPage': true});
//                           }
//                         : null,
//                     child: const Text("Next"),
//                   ),
//                 ],
//               ),
//             )
//           : null,
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ResultScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final Map<String, dynamic>? args = Get.arguments;
//     final List<dynamic> persons = args?['persons'] ?? [];
//     final int currentPage = args?['currentPage'] ?? 1;
//     final bool hasNextPage = args?['hasNextPage'] ?? false;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Search Results"),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: persons.isEmpty
//           ? const Center(child: Text("No results found"))
//           : ListView.builder(
//               itemCount: persons.length,
//               itemBuilder: (context, index) {
//                 var person = persons[index];

//                 var name = person['name'] ?? {};
//                 var firstName = name['firstName'] ?? 'Unknown';
//                 var lastName = name['lastName'] ?? 'Unknown';
//                 var fullName = person['fullName'] ?? 'Unknown';
//                 var dob = person['dob'] ?? 'Unknown';
//                 var age = person['age'] ?? 'Unknown';
//                 var firstPhoneNumber =
//                     person['phoneNumbers'] is List<dynamic> &&
//                             person['phoneNumbers'].isNotEmpty
//                         ? person['phoneNumbers'][0]
//                             ['phoneNumber'] // Access the first phone number
//                         : 'No phone numbers available';

//                 var firstEmail = person['emailAddresses'] is List<dynamic> &&
//                         person["emailAddresses"].isNotEmpty
//                     ? person['emailAddresses'][0]["emailAddress"]
//                     : "No email available";
//                 var firstAddress = person['addresses'] is List<dynamic> &&
//                         person['addresses'].isNotEmpty
//                     ? person['addresses'][0]
//                         ["fullAddress"] // Access the first address object
//                     : 'No addresses available';

//                 return InkWell(
//                   onTap: () {},
//                   child: Card(
//                     margin:
//                         const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                     elevation: 4,
//                     child: ListTile(
//                       title: Text("$firstName $lastName",
//                           style: const TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.bold)),
//                       subtitle: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Full Name
//                           Text(
//                             "Full Name: ${fullName}",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           // Date of Birth
//                           Text(
//                             "Date of Birth: ${person['dob'] != null && person['dob'].isNotEmpty ? person['dob'] : 'Not available'}",
//                             style: TextStyle(color: Colors.black, fontSize: 14),
//                           ),
//                           // Age
//                           Text(
//                             "Age: $age",
//                             style: TextStyle(color: Colors.black, fontSize: 14),
//                           ),

//                           // Phone Numbers - Display each phone number separately
//                           Text(
//                             "phoneNumbers: $firstPhoneNumber",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.bold),
//                           ),

//                           Text(
//                             "Email: $firstEmail",
//                             style: TextStyle(color: Colors.black, fontSize: 14),
//                           ),

//                           // // Addresses
//                           Text(
//                             "Address: $firstAddress",
//                             style: TextStyle(color: Colors.black, fontSize: 14),
//                           ),
//                         ],
//                       ),
//                       leading: const Icon(Icons.person, color: Colors.blue),
//                       onTap: () {
//                         // Navigate to Person Detail Screen
//                         Get.to(() => PersonDetailScreen(personData: person));
//                       },
//                     ),
//                   ),
//                 );
//               },
//             ),
//       bottomNavigationBar: persons.isNotEmpty
//           ? Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     onPressed: currentPage > 1
//                         ? () {
//                             (result: {'loadPreviousPage': true});
//                           }
//                         : null,
//                     child: const Text("Previous"),
//                   ),
//                   Text("Page $currentPage"),
//                   ElevatedButton(
//                     onPressed: hasNextPage
//                         ? () {
//                             Get.back(result: {'loadNextPage': true});
//                           }
//                         : null,
//                     child: const Text("Next"),
//                   ),
//                 ],
//               ),
//             )
//           : null,
//     );
//   }
// }

// class PersonDetailScreen extends StatelessWidget {
//   final Map<String, dynamic> personData;

//   PersonDetailScreen({required this.personData});

//   @override
//   Widget build(BuildContext context) {
//     var name = personData['name'] ?? {};
//     var fullName = name['fullName'] ?? 'Unknown';
//     var dob = personData['dob'] ?? 'Unknown';
//     var age = personData['age'] ?? 'Unknown';
//     var phoneNumbers = personData['phoneNumbers'] as List<dynamic>?;
//     var emails = personData['emailAddresses'] as List<dynamic>?;
//     var addresses = personData['addresses'] as List<dynamic>?;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Person Details'),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Full Name: $fullName',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             Text('Date of Birth: $dob', style: TextStyle(fontSize: 16)),
//             Text('Age: $age', style: TextStyle(fontSize: 16)),
//             SizedBox(height: 16),
//             Text('Phone Numbers:',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             phoneNumbers != null && phoneNumbers.isNotEmpty
//                 ? Column(
//                     children: phoneNumbers.map((phone) => Text(phone)).toList(),
//                   )
//                 : Text('No phone numbers available',
//                     style: TextStyle(fontSize: 14)),
//             SizedBox(height: 16),
//             Text('Emails:',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             emails != null && emails.isNotEmpty
//                 ? Column(
//                     children: emails.map((email) => Text(email)).toList(),
//                   )
//                 : Text('No emails available', style: TextStyle(fontSize: 14)),
//             SizedBox(height: 16),
//             Text('Addresses:',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             addresses != null && addresses.isNotEmpty
//                 ? Column(
//                     children:
//                         addresses.map((address) => Text(address)).toList(),
//                   )
//                 : Text('No addresses available',
//                     style: TextStyle(fontSize: 14)),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args = Get.arguments;
    final List<dynamic> persons = args?['persons'] ?? [];
    final int currentPage = args?['currentPage'] ?? 1;
    final bool hasNextPage = args?['hasNextPage'] ?? false;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Results"),
        backgroundColor: Colors.blueAccent,
      ),
      body: persons.isEmpty
          ? const Center(child: Text("No results found"))
          : ListView.builder(
              itemCount: persons.length,
              itemBuilder: (context, index) {
                var person = persons[index];

                var id = person['id'] ?? 'Unknown'; // Extract person ID
                var firstName = person['name']?['firstName'] ?? 'Unknown';
                var lastName = person['name']?['lastName'] ?? 'Unknown';
                var fullName = person['fullName'] ?? 'Unknown';
                var age = person['age'] ?? 'Unknown';
                var firstPhoneNumber = (person['phoneNumbers'] is List &&
                        person['phoneNumbers'].isNotEmpty)
                    ? person['phoneNumbers'][0]['phoneNumber']
                    : 'No phone numbers available';

                return InkWell(
                  onTap: () {
                    Get.to(() => PersonDetailScreen(),
                        arguments: {'id': id, 'personData': person});
                  },
                  child: Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    elevation: 4,
                    child: ListTile(
                      title: Text("$firstName $lastName",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Full Name: $fullName",
                              style: TextStyle(fontSize: 14)),
                          Text("Age: $age", style: TextStyle(fontSize: 14)),
                          Text("Phone: $firstPhoneNumber",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      leading: const Icon(Icons.person, color: Colors.blue),
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: persons.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: currentPage > 1
                        ? () {
                            Get.back(result: {'loadPreviousPage': true});
                          }
                        : null,
                    child: const Text("Previous"),
                  ),
                  Text("Page $currentPage"),
                  ElevatedButton(
                    onPressed: hasNextPage
                        ? () {
                            Get.back(result: {'loadNextPage': true});
                          }
                        : null,
                    child: const Text("Next"),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}

// class PersonDetailScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final Map<String, dynamic>? args = Get.arguments;
//     final String personId =
//         args?['id']?.toString() ?? 'Unknown'; // Convert to String
//     final Map<String, dynamic> personData = args?['personData'] ?? {};

//     var fullName = personData['fullName'] ?? 'Unknown';
//     var dob = personData['dob'] ?? 'Unknown';
//     var age = personData['age'] ?? 'Unknown';
//     var phoneNumbers = personData['phoneNumbers'] as List<dynamic>?;
//     var emails = personData['emailAddresses'] as List<dynamic>?;
//     var addresses = personData['addresses'] as List<dynamic>?;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Person Details '), // Ensure ID is String
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Full Name: $fullName',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               Text('Date of Birth: $dob', style: TextStyle(fontSize: 16)),
//               Text('Age: $age', style: TextStyle(fontSize: 16)),
//               SizedBox(height: 16),

//               // Phone Numbers
//               Text('Phone Numbers:',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//               phoneNumbers != null && phoneNumbers.isNotEmpty
//                   ? Column(
//                       children: phoneNumbers
//                           .map((phone) =>
//                               Text(phone['phoneNumber'] ?? 'Unknown'))
//                           .toList(),
//                     )
//                   : Text('No phone numbers available',
//                       style: TextStyle(fontSize: 14)),

//               SizedBox(height: 16),

//               // Emails
//               Text('Emails:',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//               emails != null && emails.isNotEmpty
//                   ? Column(
//                       children: emails
//                           .map((email) =>
//                               Text(email['emailAddress'] ?? 'Unknown'))
//                           .toList(),
//                     )
//                   : Text('No emails available', style: TextStyle(fontSize: 14)),

//               SizedBox(height: 16),

//               // Addresses
//               Text('Addresses:',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//               addresses != null && addresses.isNotEmpty
//                   ? Column(
//                       children: addresses
//                           .map((address) =>
//                               Text(address['fullAddress'] ?? 'Unknown'))
//                           .toList(),
//                     )
//                   : Text('No addresses available',
//                       style: TextStyle(fontSize: 14)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class PersonDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args = Get.arguments;
    final String personId = args?['id']?.toString() ?? 'Unknown';
    final Map<String, dynamic> personData = args?['personData'] ?? {};

    var fullName = personData['fullName'] ?? 'Unknown';
    var dob = personData['dob'] ?? 'Unknown';
    var age = personData['age'] ?? 'Unknown';
    var phoneNumbers = personData['phoneNumbers'] as List<dynamic>?;
    var emails = personData['emailAddresses'] as List<dynamic>?;
    var addresses = personData['addresses'] as List<dynamic>?;

    return Scaffold(
      appBar: AppBar(
        title: Text('Person Details'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        // ✅ Enables Scrolling for Small Screens
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow('Full Name', fullName),
            _buildInfoRow('Date of Birth',
                (dob != null && dob.isNotEmpty) ? dob : "Not available"),
            _buildInfoRow(
                'Age', (age != null) ? age.toString() : "Not available"),

            const SizedBox(height: 16),

            // 📞 Phone Numbers Section
            _buildSectionTitle('Phone Numbers'),
            phoneNumbers != null && phoneNumbers.isNotEmpty
                ? _buildList(phoneNumbers, 'phoneNumber')
                : _buildNoDataText('No phone numbers available'),

            const SizedBox(height: 16),

            // 📧 Email Section
            _buildSectionTitle('Emails'),
            emails != null && emails.isNotEmpty
                ? _buildList(emails, 'emailAddress')
                : _buildNoDataText('No emails available'),

            const SizedBox(height: 16),

            // 📍 Address Section
            _buildSectionTitle('Addresses'),
            addresses != null && addresses.isNotEmpty
                ? _buildList(addresses, 'fullAddress')
                : _buildNoDataText('No addresses available'),
          ],
        ),
      ),
    );
  }

  // 🔹 Reusable Widget for Information Rows
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            "$label: ".toString(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis, // Prevents overflow issues
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Reusable Widget for Section Titles
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
    );
  }

  // 🔹 Reusable Widget for No Data Message
  Widget _buildNoDataText(String message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(message,
          style: const TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  // 🔹 Reusable Widget for Dynamic Lists (Phone, Email, Address)
  Widget _buildList(List<dynamic> items, String key) {
    return ListView.builder(
      shrinkWrap: true, // ✅ Important to prevent infinite height issue
      physics:
          const NeverScrollableScrollPhysics(), // ✅ Prevents nested scrolling issues
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Text(
            items[index][key] ?? 'Unknown',
            style: const TextStyle(fontSize: 16),
          ),
        );
      },
    );
  }
}
