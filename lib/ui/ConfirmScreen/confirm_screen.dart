import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart' show rootBundle;
import 'package:virualapi/ui/Stripe/stripe.dart';

class ConfirmScreen extends StatefulWidget {
  final List<Map<String, dynamic>>? selectedItems;
  final int? totalPrice;
  final String? tahoeId;

  const ConfirmScreen({this.selectedItems, this.totalPrice, this.tahoeId});

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
  Widget build(BuildContext context) {
    final indicatorTotal = _comprehensiveReport ? 0 : widget.totalPrice;
    final servicesTotal = _comprehensiveReport ? _comprehensiveReportPrice : 0;
    final socialTotal = _socialMediaRepost ? _socialMediaFee : 0;
    final grandTotal = indicatorTotal! + servicesTotal + socialTotal;

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
                  // Show either indicators or comprehensive report
                  if (!_comprehensiveReport)
                    SizedBox(
                      height: 300,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Text(
                                'Selected Indicators',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: widget.selectedItems!.length,
                                  itemBuilder: (context, index) {
                                    final item = widget.selectedItems![index];
                                    return ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      dense: true,
                                      title: Text(
                                        item['label'],
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      trailing: Text(
                                        '\$${item['price']}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Divider(height: 1),
                              Padding(
                                padding: EdgeInsets.only(top: 4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Subtotal:',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      '\$${widget.totalPrice}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (_comprehensiveReport)
                    SizedBox(
                      height: 300,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Text(
                                'Comprehensive Report',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Expanded(
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.assignment,
                                          size: 50, color: Colors.blue),
                                      SizedBox(height: 16),
                                      Text(
                                        'Full detailed report including all indicators',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        '\$$_comprehensiveReportPrice',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  SizedBox(height: 12),

                  // Options
                  Card(
                    child: CheckboxListTile(
                      activeColor: Colors.white,
                      checkColor: COLOR_PRIMARY,
                      title: Text('Comprehensive Report'),
                      subtitle: Text(_comprehensiveReport
                          ? 'Selected (\$$_comprehensiveReportPrice)'
                          : 'Replace indicators with full report (\$$_comprehensiveReportPrice)'),
                      value: _comprehensiveReport,
                      onChanged: (bool? value) =>
                          setState(() => _comprehensiveReport = value ?? false),
                      secondary: Icon(Icons.assignment),
                    ),
                  ),

                  Card(
                    child: CheckboxListTile(
                      activeColor: Colors.white,
                      checkColor: COLOR_PRIMARY,
                      title: Text('Social Media Repost'),
                      subtitle:
                          Text('\$$_socialMediaFee • Shared within 24 hours'),
                      value: _socialMediaRepost,
                      onChanged: (bool? value) =>
                          setState(() => _socialMediaRepost = value ?? false),
                      secondary: Icon(Icons.share),
                    ),
                  ),

                  // Total summary
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          if (_comprehensiveReport)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Comprehensive Report:'),
                                Text('\$$_comprehensiveReportPrice'),
                              ],
                            ),
                          if (!_comprehensiveReport)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Indicators Total:'),
                                Text('\$${widget.totalPrice}'),
                              ],
                            ),
                          if (_socialMediaRepost)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Social Media Repost:'),
                                Text('\$$_socialMediaFee'),
                              ],
                            ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('TOTAL:',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text('\$$grandTotal',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  Spacer(),
                  ElevatedButton(
                    onPressed: () => _showConfirmation(context, grandTotal),
                    child: Text('CONFIRM ORDER'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: COLOR_PRIMARY,
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  /// Correct code

  // Future<void> _callSelectedReports(String? id) async {
  //   if (id == null ||
  //       id.isEmpty ||
  //       widget.selectedItems == null ||
  //       widget.selectedItems!.isEmpty) {
  //     if (mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //             content:
  //                 Text('Please select indicators and provide a valid ID.')),
  //       );
  //     }
  //     return;
  //   }

  //   if (mounted) setState(() => _isLoading = true);

  //   // 🧩 Master map of indicator => API info
  //   final Map<String, Map<String, String>> apiMap = {
  //     'Background': {
  //       'url': 'https://api.galaxysearchapi.com/personsearch',
  //       'type': 'BackgroundReport',
  //     },
  //     'Criminal': {
  //       'url': 'https://api.galaxysearchapi.com/CriminalSearch/V2',
  //       'type': 'CriminalV2',
  //     },
  //     'Business': {
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
  //       'type': 'Domain'
  //     }
  //   };

  //   try {
  //     for (final selected in widget.selectedItems!) {
  //       final label =
  //           selected['label']; // This is the UI label you want to match
  //       print('🔹 Selected Label: $label');

  //       if (!apiMap.containsKey(label)) {
  //         print('❌ No API found for $label');
  //         continue;
  //       }

  //       final api = apiMap[label]!;

  //       final headers = {
  //         'Galaxy-Ap-Password': '2397b0ba0f8a4ea0aaea17e781e11305',
  //         'Galaxy-Search-Type': api['type']!,
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json',
  //         'Galaxy-Ap-Name': 'ethosinv',
  //       };

  //       Dio dio = Dio()..options.headers = headers;

  //       final response = await dio.post(
  //         api['url']!,
  //         data: {'tahoeId': id},
  //       );

  //       if (response.statusCode == 200) {
  //         print("✅ ${api['type']} Success: ${response.data}");
  //       } else {
  //         print("❌ ${api['type']} failed.");
  //       }
  //     }
  //   } catch (e) {
  //     if (mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('🚨 Error during report fetching: $e')),
  //       );
  //     }
  //   } finally {
  //     if (mounted) setState(() => _isLoading = false);
  //   }
  //}

  Future<void> _callSelectedReports(String? id) async {
    if (id == null ||
        id.isEmpty ||
        widget.selectedItems == null ||
        widget.selectedItems!.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text('Please select indicators and provide a valid ID.')),
        );
      }
      return;
    }

    if (mounted) setState(() => _isLoading = true);

    final Map<String, dynamic> collectedResponses = {};

    // 🧩 Master map of indicator => API info
    final Map<String, Map<String, String>> apiMap = {
      'Background': {
        'url': 'https://api.galaxysearchapi.com/personsearch',
        'type': 'BackgroundReport',
      },
      'Criminal': {
        'url': 'https://api.galaxysearchapi.com/CriminalSearch/V2',
        'type': 'CriminalV2',
      },
      'Business': {
        'url': 'https://api.galaxysearchapi.com/BusinessV2Search',
        'type': 'BusinessV2',
      },
      'Fein Records': {
        'url': 'https://api.galaxysearchapi.com/feinsearch',
        'type': 'Fein',
      },
      'Debt Records': {
        'url': 'https://api.galaxysearchapi.com/DebtSearch/V2',
        'type': 'DebtV2',
      },
      'Ofac': {
        'url': 'https://api.galaxysearchapi.com/OfacSearch',
        'type': 'Ofac',
      },
      'Property Records': {
        'url': 'https://api.galaxysearchapi.com/PropertyV2Search',
        'type': 'PropertyV2',
      },
      'Workplace Records': {
        'url': 'https://api.galaxysearchapi.com/WorkplaceSearch',
        'type': 'Workplace',
      },
      'DEA Records': {
        'url': 'https://api.galaxysearchapi.com/deasearch',
        'type': 'Dea',
      },
      'Marriage Records': {
        'url': 'https://api.galaxysearchapi.com/MarriageSearch',
        'type': 'Marriage',
      },
      'Divorce Records': {
        'url': 'https://api.galaxysearchapi.com/DivorceSearch',
        'type': 'Divorce',
      },
      'Foreclosures Records': {
        'url': 'https://api.galaxysearchapi.com/ForeclosureV2Search',
        'type': 'ForeclosureV2',
      },
      'Domains Records': {
        'url': 'https://api.galaxysearchapi.com/DomainSearch',
        'type': 'Domain'
      }
    };

    try {
      for (final selected in widget.selectedItems!) {
        final label = selected['label'];
        print('🔹 Selected Label: $label');

        if (!apiMap.containsKey(label)) {
          print('❌ No API found for $label');
          continue;
        }

        final api = apiMap[label]!;

        final headers = {
          'Galaxy-Ap-Password': '2397b0ba0f8a4ea0aaea17e781e11305',
          'Galaxy-Search-Type': api['type']!,
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Galaxy-Ap-Name': 'ethosinv',
        };

        Dio dio = Dio()..options.headers = headers;

        final response = await dio.post(
          api['url']!,
          data: {'tahoeId': id},
        );

        if (response.statusCode == 200) {
          print("✅ ${api['type']} Success: ${response.data}");
          collectedResponses[label] = response.data;
        } else {
          print("❌ ${api['type']} failed.");
        }
      }

      if (collectedResponses.isNotEmpty) {
        await _generatePdf(collectedResponses);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('🚨 Error during report fetching: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<pw.Font> _loadFont(String path) async {
    final fontData = await rootBundle.load(path);
    return pw.Font.ttf(fontData);
  }

  Future<void> _generatePdf(Map<String, dynamic> data) async {
    final pdf = pw.Document();

    final regularFont = await _loadFont('assets/fonts/NotoSans-Regular.ttf');
    final boldFont = await _loadFont('assets/fonts/NotoSans-Bold.ttf');

    pdf.addPage(
      pw.MultiPage(
        theme: pw.ThemeData.withFont(
          base: regularFont,
          bold: boldFont,
        ),
        build: (pw.Context context) {
          return data.entries.map((entry) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(entry.key,
                    style: pw.TextStyle(
                        fontSize: 18, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 5),
                pw.Text(
                    const JsonEncoder.withIndent('  ').convert(entry.value)),
                pw.Divider(),
              ],
            );
          }).toList();
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  void _showConfirmation(BuildContext context, int total) {
    print(widget.selectedItems!.length);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Payment'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('You are purchasing:'),
            SizedBox(height: 8),
            Text(_comprehensiveReport
                ? 'Comprehensive Report'
                : '${widget.selectedItems!.length} Indicators'),
            if (_socialMediaRepost) Text('+ Social Media Repost'),
            Divider(),
            Text('Total Amount:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('\$$total',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('CANCEL'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StripeSandbox()),
              );

              // if (_comprehensiveReport) {
              //   await _callSelectedReports(widget.tahoeId ?? '');
              // }

              // _callSelectedReports(widget.tahoeId ?? '');

              // if (!mounted) return;

              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(content: Text('Order confirmed! Total: \$$total')),
              // );
            },
            child: Text('CONFIRM'),
          ),
        ],
      ),
    );
  }
}
