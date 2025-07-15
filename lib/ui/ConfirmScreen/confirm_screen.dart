import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/services/app_preferences.dart';
import 'package:virualapi/services/stripe_service.dart';
import 'package:virualapi/ui/Stripe/stripe.dart'; // Update to your project path

class ConfirmScreen extends StatefulWidget {
  final List<Map<String, dynamic>>? selectedItems;
  final int? totalPrice;
  final String? tahoeId;
  final String? useremail;
  final String? address;
  final String? email;
  final String? firstname;
  final String? lastname;
  final String? dob;
  final String? age;
  final int isMob = 1;
  final String? intentId;
  final int? social_media_report;
  //  "is_mob":1,    //0 or 1
  //  "intent_id":"pi_3RjJLeQLD6zl82IG1uI10NRZ",
  //  //"stripe_token":"26",
  //  "social_media_report":0

  const ConfirmScreen(
      {this.selectedItems,
      this.totalPrice,
      this.intentId,
      this.social_media_report,
      this.tahoeId,
      this.useremail,
      this.address,
      this.email,
      this.age,
      this.dob,
      this.firstname,
      this.lastname});

  @override
  _ConfirmScreenState createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  bool _comprehensiveReport = false;
  bool _socialMediaRepost = false;
  final int _comprehensiveReportPrice = 80;
  final int _socialMediaFee = 20;
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dynamic vv = widget.selectedItems;
    print("Confirm Screeen $vv");
    print(widget.firstname);
    print(widget.lastname);
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    final indicatorTotal = _comprehensiveReport ? 0 : widget.totalPrice ?? 0;
    final servicesTotal = _comprehensiveReport ? _comprehensiveReportPrice : 0;
    final socialTotal = _socialMediaRepost ? _socialMediaFee : 0;
    final grandTotal = indicatorTotal + servicesTotal + socialTotal;

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Confirmation'),
        backgroundColor: COLOR_PRIMARY,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // --- Display based on Comprehensive selection
                  if (!_comprehensiveReport) _buildIndicatorsCard(),
                  if (_comprehensiveReport) _buildComprehensiveCard(),

                  SizedBox(height: 12),

                  // --- Checkbox options
                  _buildCheckboxes(),

                  // --- Totals
                  _buildTotalCard(grandTotal),

                  Spacer(),

                  ElevatedButton(
                    onPressed: () => _showConfirmation(context, grandTotal),
                    child: Text('CONFIRM ORDER'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: COLOR_PRIMARY,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildIndicatorsCard() {
    return SizedBox(
      height: 300,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Text('Selected Indicators',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.selectedItems!.length,
                  itemBuilder: (context, index) {
                    final item = widget.selectedItems![index];
                    return ListTile(
                      title:
                          Text(item['label'], style: TextStyle(fontSize: 14)),
                      trailing: Text('\$${item['price']}',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.green)),
                    );
                  },
                ),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Subtotal:', style: TextStyle(fontSize: 14)),
                  Text('\$${widget.totalPrice}',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildComprehensiveCard() {
    return SizedBox(
      height: 300,
      child: Card(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.assignment, size: 50, color: Colors.blue),
              SizedBox(height: 16),
              Text('Comprehensive Report',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('Full detailed report including all indicators'),
              SizedBox(height: 8),
              Text('\$$_comprehensiveReportPrice',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckboxes() {
    return Column(
      children: [
        Card(
          child: CheckboxListTile(
            activeColor: Colors.white,
            checkColor: COLOR_PRIMARY,
            title: Text('Comprehensive Report'),
            subtitle: Text(_comprehensiveReport
                ? 'Selected (\$$_comprehensiveReportPrice)'
                : 'Replace indicators with full report'),
            value: _comprehensiveReport,
            onChanged: (val) =>
                setState(() => _comprehensiveReport = val ?? false),
            secondary: Icon(Icons.assignment),
          ),
        ),
        Card(
          child: CheckboxListTile(
            activeColor: Colors.white,
            checkColor: COLOR_PRIMARY,
            title: Text('Social Media Repost'),
            subtitle: Text('\$$_socialMediaFee • Shared within 24 hours'),
            value: _socialMediaRepost,
            onChanged: (val) => setState(() {
              _socialMediaRepost = val ?? false;
              print(_socialMediaRepost);
            }),
            secondary: Icon(Icons.share),
          ),
        ),
      ],
    );
  }

  Widget _buildTotalCard(int total) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            if (_comprehensiveReport)
              _buildPriceRow(
                  'Comprehensive Report:', _comprehensiveReportPrice),
            if (!_comprehensiveReport)
              _buildPriceRow('Indicators Total:', widget.totalPrice ?? 0),
            if (_socialMediaRepost)
              _buildPriceRow('Social Media Repost:', _socialMediaFee),
            Divider(),
            _buildPriceRow('TOTAL:', total,
                isBold: true, color: Colors.green, fontSize: 18),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceRow(String label, int value,
      {bool isBold = false, Color color = Colors.black, double fontSize = 14}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: fontSize,
                fontWeight: isBold ? FontWeight.bold : null)),
        Text('\$$value',
            style: TextStyle(
                fontSize: fontSize,
                fontWeight: isBold ? FontWeight.bold : null,
                color: color)),
      ],
    );
  }

  // void _showConfirmation(BuildContext context, int total) {
  //   showDialog(
  //     context: context,
  //     builder: (_) => AlertDialog(
  //       title: Text('Confirm Payment'),
  //       content: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Text('You are purchasing:'),
  //           SizedBox(height: 8),
  //           Text(_comprehensiveReport
  //               ? 'Comprehensive Report'
  //               : '${widget.selectedItems!.length} Indicators'),
  //           if (_socialMediaRepost) Text('+ Social Media Repost'),
  //           Divider(),
  //           Text('Total Amount:'),
  //           Text('\$$total',
  //               style: TextStyle(
  //                   fontSize: 24,
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.green)),
  //         ],
  //       ),
  //       actions: [
  //         // TextButton(
  //         //     onPressed: () => Navigator.pop(context), child: Text('CANCEL')),
  //         // ElevatedButton(
  //         //   onPressed: () async {
  //         //     Navigator.pop(context);
  //         //     setState(() => _isLoading = true);

  //         //     if (_comprehensiveReport) {
  //         //       await _callSingleBackgroundApi(
  //         //           widget.tahoeId ?? '', widget.useremail ?? '');
  //         //     } else {
  //         //       await _callSelectedReports(
  //         //           widget.tahoeId ?? '', widget.useremail ?? '');
  //         //     }

  //         //     setState(() => _isLoading = false);
  //         //   },
  //         //   child: Text('CONFIRM'),
  //         // ),

  //         TextButton(
  //           onPressed: () => Navigator.pop(context),
  //           child: Text('CANCEL'),
  //         ),
  //         ElevatedButton(
  //           onPressed: () {
  //             Navigator.pop(context);
  //             StripeService.instance.makePayment(amount: total);

  //             // Get.toNamed(
  //             //   Routers.stripe,
  //             //   arguments: {
  //             //     'useremail': widget.useremail,
  //             //     'tahoeId': widget.tahoeId,
  //             //     'selectedItems': widget.selectedItems,
  //             //     'isComprehensive': _comprehensiveReport,
  //             //   },
  //             // );
  //           },
  //           child: Text('CONFIRM'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

//   void _showConfirmation(BuildContext context, int total) {
//   showDialog(
//     context: context,
//     builder: (_) => AlertDialog(
//       title: Text('Confirm Payment'),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text('You are purchasing:'),
//           SizedBox(height: 8),
//           Text(_comprehensiveReport
//               ? 'Comprehensive Report'
//               : '${widget.selectedItems!.length} Indicators'),
//           if (_socialMediaRepost) Text('+ Social Media Report'),
//           Divider(),
//           Text('Total Amount:'),
//           Text(
//             '\$$total',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Colors.green,
//             ),
//           ),
//         ],
//       ),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.pop(context),
//           child: Text('CANCEL'),
//         ),
//         ElevatedButton(
//           onPressed: () async {
//             Navigator.pop(context);

//             /// Show loading
//             setState(() => _isLoading = true);

//             /// Make Stripe Payment
//             final paymentIntentId = await StripeService.instance.makePaymentWithReturn(
//               amount: total,
//               userEmail: widget.useremail,
//               tahoeId: widget.tahoeId,
//             );

//             if (paymentIntentId != null) {
//               // Payment successful — now call your report logic
//               if (_comprehensiveReport) {
//                 await _callSingleBackgroundApi(widget.tahoeId ?? '', widget.useremail ?? '');
//               } else {
//                 await _callSelectedReports(widget.tahoeId ?? '', widget.useremail ?? '');
//               }
//             }

//             /// Hide loading
//             setState(() => _isLoading = false);
//           },
//           child: Text('CONFIRM'),
//         ),
//       ],
//     ),
//   );
// }

  void _showConfirmation(BuildContext context, int total) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          width: 350, // 👈 Adjust width as needed
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Confirm Payment',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              Text('You are purchasing:'),
              SizedBox(height: 8),
              Text(
                _comprehensiveReport
                    ? 'Comprehensive Report'
                    : '${widget.selectedItems!.length} Indicators',
              ),
              if (_socialMediaRepost) Text('+ Social Media Report'),
              Divider(height: 30),
              Text('Total Amount:'),
              Text(
                '\$$total',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('CANCEL'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      setState(() => _isLoading = true);

                      final paymentIntentId =
                          await StripeService.instance.makePayment(
                        amount: total,
                      );

                      if (paymentIntentId != null) {
                        if (_comprehensiveReport) {
                          await _callSingleBackgroundApi(
                              widget.tahoeId ?? '',
                              widget.useremail ?? '',
                              widget.age ?? '',
                              widget.firstname ?? '',
                              widget.lastname ?? '',
                              widget.isMob,
                              paymentIntentId, // intentId
                              total.toString(), // amount
                              (_socialMediaRepost ? 1 : 0) == 1);

                          ;
                        } else {
                          await _callSelectedReports(
                              widget.tahoeId ?? '',
                              widget.useremail ?? '',
                              widget.age ?? '',
                              widget.firstname ?? '',
                              widget.lastname ?? '',
                              widget.isMob,
                              paymentIntentId,
                              total.toString(),
                              (_socialMediaRepost ? 1 : 0) == 1);
                        }
                      }

                      setState(() => _isLoading = false);
                    },
                    child: Text('CONFIRM'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _callSingleBackgroundApi(
    String id,
    String email,
    String age,
    String firstname,
    String lastname,
    int isMob,
    String intentId,
    String amount,
    bool isSocialMediaReport,
  ) async {
    final token = AppPreferences.getAuthToken();
    final headers = {'Authorization': 'Bearer $token'};

    final payload = {
      "email": email,
      "tahoe_id": id,
      "first_name": firstname,
      "last_name": lastname,
      "is_mob": isMob,
      "amount": amount,
      "intent_id": intentId,
      "social_media_report": isSocialMediaReport ? 1 : 0,
      "age": age,
      "types": [
        {
          "label": "Comprehensive Report",
          "key": "hasComprehensiveReport",
          "price": _comprehensiveReportPrice,
          "count": 0
        },
        {
          "label": "Debt Records",
          "key": "hasDebtRecords",
          "price": 6,
          "count": 0
        },
        {
          "label": "Identity Verification",
          "key": "hasIdentityVerification",
          "price": 0.25,
          "count": 0
        },
        {
          "label": "Person Search",
          "key": "hasPersonSearch",
          "price": 0.25,
          "count": 0
        },
        {
          "label": "Census Search",
          "key": "hasCensusSearch",
          "price": 0.25,
          "count": 0
        },
        {
          "label": "Criminal",
          "key": "hasCriminalRecords",
          "price": 2.00,
          "count": 0
        },
        {
          "label": "Divorce Records",
          "key": "hasDivorceRecords",
          "price": 0.05,
          "count": 0
        },
        {
          "label": "Marriage Records",
          "key": "hasMarriageRecords",
          "price": 0.10,
          "count": 0
        },
        {
          "label": "Property Records",
          "key": "hasPropertyRecords",
          "price": 0.25,
          "count": 0
        },
        {
          "label": "Business Records",
          "key": "hasBusinessRecords",
          "price": 0.50,
          "count": 0
        },
        {"label": "Ofac", "key ": "hasOfacRecords", "price": 0.10, "count": 0},
        {
          "label": "Workplace Records",
          "key": "hasWorkplaceRecords",
          "price": 0.50,
          "count": 0
        },
        {
          "label": "DEA Records",
          "key": "hasDeaRecords",
          "price": 0.10,
          "count": 0
        },
        {
          "label": "Foreclosures Records",
          "key": "hasForeclosuresRecords",
          "price": 0.10,
          "count": 0
        },
        {
          "label": "Domains Records",
          "key": "hasDomainsRecords",
          "price": 0.10,
          "count": 0
        },
        {
          "label": "Eviction Search",
          "key": "hasEvictionRecords",
          "price": 0.10,
          "count": 0
        },
        {
          "label": "Pro License Search",
          "key": "hasProfessionalLicenseRecords",
          "price": 0.10,
          "count": 0
        },
        {
          "label": "Reverse Phone Search",
          "key": "hasReversePhoneSearch",
          "price": 0.05,
          "count": 0
        },
        {
          "label": "Vehicle Ownership Search",
          "key": "hasVehicleOwnershipSearch",
          "price": 3.00,
          "count": 0
        },
        {
          "label": "Comprehensive Report",
          "key": "haComprehensiveReport",
          "price": 3.00,
          "count": 0
        }
      ],
    };

    try {
      final dio = Dio()..options.headers = headers;
      print('Compehensive:    $payload');
      final response = await dio.post(
        'https://server.testlinkwebsitespace.com/virtual-pi-backend/public/api/generate-report',
        data: payload,
      );

      if (response.statusCode == 200 && response.data['status'] == true) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
              content: Text(response.data['message'] ??
                  'Report generated successfully.')),
        );
      } else {
        _showError(
            'API failed: ${response.data['message'] ?? 'Unknown error'}');
      }
    } catch (e) {
      _showError('Request error: $e');
    }
  }

  Future<void> _callSelectedReports(
    String id,
    String email,
    String age,
    String firstname,
    String lastname,
    int isMob,
    String intentId,
    String amount,
    bool isSocialMediaReport,
  ) async {
    final token = AppPreferences.getAuthToken();
    final headers = {'Authorization': 'Bearer $token'};

    final dio = Dio()..options.headers = headers;

    try {
      // Build a single types list from all selected items
      final List<Map<String, dynamic>> typesList = widget.selectedItems!
          .map((item) => {
                "label": item['label'],
                "key": item['key'],
                "price": item['price'],
                "count": 0,
              })
          .toList();

      final payload = {
        "email": email,
        "tahoe_id": id,
        "first_name": firstname,
        "last_name": lastname,
        "age": age,
        "is_mob": isMob,
        "amount": amount,
        "intent_id": intentId,
        "social_media_report": isSocialMediaReport ? 1 : 0,
        "types": typesList,
      };
      print('Seleced:    $payload');
      final response = await dio.post(
        'https://server.testlinkwebsitespace.com/virtual-pi-backend/public/api/generate-report',
        data: payload,
      );

      if (response.statusCode == 200 && response.data['status'] == true) {
        print('✅ Report success');
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content:
                Text(response.data['message'] ?? 'Reports sent successfully.'),
          ),
        );
      } else {
        print('❌ Report failed: ${response.data['message']}');
        _showError(
            'Report failed: ${response.data['message'] ?? 'Unknown error'}');
      }
    } catch (e) {
      _showError('Request error: $e');
      print('Request error, $e');
    }
  }

  // Future<void> _callSelectedReports(String id, String email) async {
  //   final headers = {
  //     'Galaxy-Ap-Password': '2397b0ba0f8a4ea0aaea17e781e11305',
  //     'Galaxy-Search-Type': 'BackgroundReport',
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Galaxy-Ap-Name': 'ethosinv',
  //   };

  //   final dio = Dio()..options.headers = headers;

  //   try {
  //     for (final item in widget.selectedItems ?? []) {
  //       final payload = {
  //         "email": email,
  //         "tahoe_id": id,
  //         "types": [
  //           {
  //             "label": item['label'],
  //             "key": item['key'],
  //             "price": item['price'],
  //             "count": 0,
  //           }
  //         ]
  //       };

  //       final response = await dio.post(
  //         'https://server.testlinkwebsitespace.com/trasers-search/public/api/generate-report',
  //         data: payload,
  //       );

  //       if (response.statusCode == 200 && response.data['status'] == true) {
  //         print('✅ ${item['label']} report success');
  //         ScaffoldMessenger.of(Get.context!).showSnackBar(
  //           SnackBar(
  //               backgroundColor: Colors.green,
  //               content: Text(
  //                   response.data['message'] ?? 'Report Sent successfully.')),
  //         );
  //       } else {
  //         print('❌ ${item['label']} failed: ${response.data['message']}');
  //         _showError(
  //             '${item['label']} failed: ${response.data['message'] ?? 'Unknown error'}');
  //       }
  //     }

  //     // All done, optionally notify the user
  //     // ScaffoldMessenger.of(context).showSnackBar(
  //     //   SnackBar(content: Text('All reports requested successfully.')),
  //     // );
  //   } catch (e) {
  //     _showError('Request error: $e');
  //   }
  // }

  // Future<void> _callSelectedReports(String id, String email) async {
  //   final Map<String, dynamic> collectedResponses = {};

  //   final apiMap = {
  //     'Background': {
  //       'url': 'https://api.galaxysearchapi.com/personsearch',
  //       'type': 'BackgroundReport',
  //     },
  //     'Criminal': {
  //       'url': 'https://api.galaxysearchapi.com/CriminalSearch/V2',
  //       'type': 'CriminalV2',
  //     },
  //     'Business Records': {
  //       'url': 'https://api.galaxysearchapi.com/BusinessV2Search',
  //       'type': 'BusinessV2',
  //     },
  //     'Fein Records': {
  //       'url': 'https://api.galaxysearchapi.com/feinsearch',
  //       'type': 'Fein',
  //     },
  //     'Debt Records': {
  //       'url': 'https://api.galaxysearchapi.com/DebtSearch/V2',
  //       'type': 'DebtV2',
  //     },
  //     'Ofac': {
  //       'url': 'https://api.galaxysearchapi.com/OfacSearch',
  //       'type': 'Ofac',
  //     },
  //     'Property Records': {
  //       'url': 'https://api.galaxysearchapi.com/PropertyV2Search',
  //       'type': 'PropertyV2',
  //     },
  //     'Workplace Records': {
  //       'url': 'https://api.galaxysearchapi.com/WorkplaceSearch',
  //       'type': 'Workplace',
  //     },
  //     'DEA Records': {
  //       'url': 'https://api.galaxysearchapi.com/deasearch',
  //       'type': 'Dea',
  //     },
  //     'Marriage Records': {
  //       'url': 'https://api.galaxysearchapi.com/MarriageSearch',
  //       'type': 'Marriage',
  //     },
  //     'Divorce Records': {
  //       'url': 'https://api.galaxysearchapi.com/DivorceSearch',
  //       'type': 'Divorce',
  //     },
  //     'Foreclosures Records': {
  //       'url': 'https://api.galaxysearchapi.com/ForeclosureV2Search',
  //       'type': 'ForeclosureV2',
  //     },
  //     'Domains Records': {
  //       'url': 'https://api.galaxysearchapi.com/DomainSearch',
  //       'type': 'Domain',
  //     },
  //   };

  //   try {
  //     for (final selected in widget.selectedItems!) {
  //       final label = selected['label'];
  //       if (!apiMap.containsKey(label)) continue;

  //       final api = apiMap[label]!;
  //       final headers = {
  //         'Galaxy-Ap-Password': '2397b0ba0f8a4ea0aaea17e781e11305',
  //         'Galaxy-Search-Type': api['type'],
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json',
  //         'Galaxy-Ap-Name': 'ethosinv',
  //       };

  //       final dio = Dio()..options.headers = headers;

  //       final response = await dio.post(api['url']!, data: {'tahoeId': id});

  //       if (response.statusCode == 200) {
  //         collectedResponses[label] = response.data;
  //         print("Selected [$label]: ${response.data}");
  //       }
  //     }

  //     // Optional: handle collectedResponses or generate PDF
  //   } catch (e) {
  //     _showError('Report fetch error: $e');
  //   }
  // }
}
