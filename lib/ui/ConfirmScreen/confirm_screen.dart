// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:pdf/pdf.dart';
// import 'package:printing/printing.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:virualapi/constants/constant.dart';
// import 'package:virualapi/core/routing/router_str.dart';
// import 'package:virualapi/services/app_preferences.dart';
// import 'package:virualapi/services/stripe_service.dart';
// import 'package:virualapi/ui/Stripe/stripe.dart';
// import 'package:virualapi/widgets/text_field.dart'; // Update to your project path

// class ConfirmScreen extends StatefulWidget {
//   final List<Map<String, dynamic>>? selectedItems;
//   final int? totalPrice;
//   final String? tahoeId;
//   final String? useremail;
//   final String? address;
//   final String? email;
//   final String? firstname;
//   final String? lastname;
//   final String? dob;
//   final String? age;
//   final int isMob = 1;
//   final String? intentId;
//   final int? social_media_report;
//   final int? comprehensive_report;
//   //  "is_mob":1,    //0 or 1
//   //  "intent_id":"pi_3RjJLeQLD6zl82IG1uI10NRZ",
//   //  //"stripe_token":"26",
//   //  "social_media_report":0

//   const ConfirmScreen(
//       {this.selectedItems,
//       this.totalPrice,
//       this.intentId,
//       this.social_media_report,
//       this.tahoeId,
//       this.useremail,
//       this.comprehensive_report,
//       this.address,
//       this.email,
//       this.age,
//       this.dob,
//       this.firstname,
//       this.lastname});

//   @override
//   _ConfirmScreenState createState() => _ConfirmScreenState();
// }

// class _ConfirmScreenState extends State<ConfirmScreen> {
//   bool _comprehensiveReport = false;
//   bool _socialMediaRepost = false;
//   final int _comprehensiveReportPrice = 80;
//   final int _socialMediaFee = 20;
//   bool _isLoading = false;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     dynamic vv = widget.selectedItems;
//     print("Confirm Screeen $vv");
//     print(widget.firstname);
//     print(widget.lastname);
//     print(widget.useremail);
//     print(widget.email);
//   }

//   void _showError(String msg) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
//   }

//   @override
//   Widget build(BuildContext context) {
//     final indicatorTotal = _comprehensiveReport ? 0 : widget.totalPrice ?? 0;
//     final servicesTotal = _comprehensiveReport ? _comprehensiveReportPrice : 0;
//     final socialTotal = _socialMediaRepost ? _socialMediaFee : 0;
//     final grandTotal = indicatorTotal + servicesTotal + socialTotal;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Order Confirmation'),
//         backgroundColor: COLOR_PRIMARY,
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   // --- Display based on Comprehensive selection
//                   if (!_comprehensiveReport) _buildIndicatorsCard(),
//                   if (_comprehensiveReport) _buildComprehensiveCard(),

//                   SizedBox(height: 12),

//                   // --- Checkbox options
//                   _buildCheckboxes(),

//                   // --- Totals
//                   _buildTotalCard(grandTotal),

//                   Spacer(),

//                   ElevatedButton(
//                     onPressed: () => _showConfirmation(context, grandTotal),
//                     child: Text('CONFIRM ORDER'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: COLOR_PRIMARY,
//                       minimumSize: Size(double.infinity, 50),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }

//   Widget _buildIndicatorsCard() {
//     return SizedBox(
//       height: 300,
//       child: Card(
//         child: Padding(
//           padding: EdgeInsets.all(12),
//           child: Column(
//             children: [
//               Text('Selected Indicators',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//               SizedBox(height: 8),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: widget.selectedItems!.length,
//                   itemBuilder: (context, index) {
//                     final item = widget.selectedItems![index];
//                     return ListTile(
//                       title:
//                           Text(item['label'], style: TextStyle(fontSize: 14)),
//                       trailing: Text('\$${item['price']}',
//                           style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.green)),
//                     );
//                   },
//                 ),
//               ),
//               Divider(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Subtotal:', style: TextStyle(fontSize: 14)),
//                   Text('\$${widget.totalPrice}',
//                       style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.green)),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildComprehensiveCard() {
//     return SizedBox(
//       height: 300,
//       child: Card(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.assignment, size: 50, color: Colors.blue),
//               SizedBox(height: 16),
//               Text('Comprehensive Report',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//               SizedBox(height: 8),
//               Text('Full detailed report including all indicators'),
//               SizedBox(height: 8),
//               Text('\$$_comprehensiveReportPrice',
//                   style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.green,
//                       fontWeight: FontWeight.bold)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCheckboxes() {
//     return Column(
//       children: [
//         Card(
//           child: CheckboxListTile(
//             activeColor: Colors.white,
//             checkColor: COLOR_PRIMARY,
//             title: Text(
//               'Comprehensive Report',
//               style: TextStyle(
//                   color: _comprehensiveReport ? COLOR_PRIMARY : DARK_BG_COLOR,
//                   fontWeight: FontWeight.bold),
//             ),
//             subtitle: Text(
//               _comprehensiveReport
//                   ? 'Selected (\$$_comprehensiveReportPrice)'
//                   : 'Replace indicators with full report',
//               style: TextStyle(
//                   color: GREY_TEXT_COLOR,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 12),
//             ),
//             value: _comprehensiveReport,
//             onChanged: (val) =>
//                 setState(() => _comprehensiveReport = val ?? false),
//             secondary: Icon(
//               Icons.assignment,
//               color: COLOR_GREEEN_TEXT,
//             ),
//           ),
//         ),
//         Card(
//           child: CheckboxListTile(
//             activeColor: Colors.white,
//             checkColor: COLOR_PRIMARY,
//             title: Text(
//               'Social Media Repost',
//               style: TextStyle(
//                   color: _socialMediaRepost ? COLOR_PRIMARY : DARK_BG_COLOR,
//                   fontWeight: FontWeight.bold),
//             ),
//             subtitle: Text(
//               '\$$_socialMediaFee • Shared within 24 hours',
//               style: TextStyle(
//                   color: GREY_TEXT_COLOR,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 12),
//             ),
//             value: _socialMediaRepost,
//             onChanged: (val) => setState(() {
//               _socialMediaRepost = val ?? false;
//               print(_socialMediaRepost);
//             }),
//             secondary: Icon(
//               Icons.share_outlined,
//               color: COLOR_PRIMARY,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildTotalCard(int total) {
//     return Card(
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             if (_comprehensiveReport)
//               _buildPriceRow(
//                   'Comprehensive Report:', _comprehensiveReportPrice),
//             if (!_comprehensiveReport)
//               _buildPriceRow('Indicators Total:', widget.totalPrice ?? 0),
//             if (_socialMediaRepost)
//               _buildPriceRow('Social Media Repost:', _socialMediaFee),
//             Divider(),
//             _buildPriceRow('TOTAL:', total,
//                 isBold: true, color: Colors.green, fontSize: 18),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildPriceRow(String label, int value,
//       {bool isBold = false, Color color = Colors.black, double fontSize = 14}) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(label,
//             style: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: isBold ? FontWeight.bold : null)),
//         Text('\$$value',
//             style: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: isBold ? FontWeight.bold : null,
//                 color: color)),
//       ],
//     );
//   }

//   void _showConfirmation(BuildContext context, int total) {
//     TextEditingController defaultemailController =
//         TextEditingController(text: widget.useremail ?? '');
//     var email = defaultemailController.text;
//     showDialog(
//       context: context,
//       builder: (_) => Dialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         child: Container(
//           width: 350, // 👈 Adjust width as needed
//           padding: EdgeInsets.all(20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text('Confirm Payment',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//               SizedBox(height: 8),

//               Text(
//                 'All Reports Will be Sent to this Email',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.green,
//                 ),
//               ),
//               SizedBox(height: 8),
//               AppTextField(
//                 name: 'email',
//                 showTitle: true,
//                 maxline: 1,
//                 rectangleborder: true,
//                 controller: defaultemailController, // pre-filled and editable
//                 validator: FormBuilderValidators.compose([
//                   FormBuilderValidators.required(),
//                   FormBuilderValidators.email(),
//                 ]),
//                 placeholder: "Email",
//               ),

//               SizedBox(height: 8),
//               // SizedBox(height: 16),
//               Text('You are purchasing:'),
//               SizedBox(height: 8),
//               Text(
//                 _comprehensiveReport
//                     ? 'Comprehensive Report'
//                     : '${widget.selectedItems!.length} Indicators',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 8),
//               if (_socialMediaRepost)
//                 Text('+ Social Media Report',
//                     style: TextStyle(fontWeight: FontWeight.bold)),
//               Divider(height: 30),
//               Text('Total Amount:'),
//               Text(
//                 '\$$total',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.green,
//                 ),
//               ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextButton(
//                     onPressed: () => Navigator.pop(context),
//                     child: Text(
//                       'CANCEL',
//                       style: TextStyle(color: COLOR_PRIMARY),
//                     ),
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: COLOR_PRIMARY),
//                     onPressed: () async {
//                       Navigator.pop(context);
//                       setState(() => _isLoading = true);

//                       final paymentIntentId =
//                           await StripeService.instance.makePayment(
//                         amount: total,
//                       );

//                       if (paymentIntentId != null) {
//                         if (_comprehensiveReport) {
//                           await _callSingleBackgroundApi(
//                               widget.tahoeId ?? '',
//                               widget.email ?? '',
//                               defaultemailController.text,
//                               widget.age ?? '',
//                               widget.firstname ?? '',
//                               widget.lastname ?? '',
//                               widget.isMob,
//                               paymentIntentId, // intentId
//                               total.toString(), // amount
//                               (_socialMediaRepost ? 1 : 0) == 1);

//                           ;
//                         } else {
//                           await _callSelectedReports(
//                               widget.tahoeId ?? '',
//                               widget.email ?? '',
//                               defaultemailController.text,
//                               widget.age ?? '',
//                               widget.firstname ?? '',
//                               widget.lastname ?? '',
//                               widget.isMob,
//                               paymentIntentId,
//                               total.toString(),
//                               (_socialMediaRepost ? 1 : 0) == 1);
//                         }
//                       }

//                       setState(() => _isLoading = false);
//                     },
//                     child: Text('CONFIRM'),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:get/get.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:pdf/pdf.dart';
// import 'package:printing/printing.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:virualapi/constants/constant.dart';
// import 'package:virualapi/core/routing/router_str.dart';
// import 'package:virualapi/services/app_preferences.dart';
// import 'package:virualapi/services/stripe_service.dart';
// import 'package:virualapi/ui/Stripe/stripe.dart';
// import 'package:virualapi/widgets/Indicator.dart';
// import 'package:virualapi/widgets/text_field.dart'; // Your custom text field widget

// class ConfirmScreen extends StatefulWidget {
//   final List<Map<String, dynamic>>? selectedItems;
//   final int? totalPrice;
//   final String? tahoeId;
//   final String? useremail;
//   final String? address;
//   final String? email;
//   final String? firstname;
//   final String? lastname;
//   final String? dob;
//   final String? age;
//   final int isMob = 1;
//   final String? intentId;
//   final int? social_media_report;
//   final int? comprehensive_report;

//   const ConfirmScreen({
//     this.selectedItems,
//     this.totalPrice,
//     this.intentId,
//     this.social_media_report,
//     this.tahoeId,
//     this.useremail,
//     this.comprehensive_report,
//     this.address,
//     this.email,
//     this.age,
//     this.dob,
//     this.firstname,
//     this.lastname,
//   });

//   @override
//   _ConfirmScreenState createState() => _ConfirmScreenState();
// }

// class _ConfirmScreenState extends State<ConfirmScreen> {
//   bool _comprehensiveReport = false;
//   bool _socialMediaReport = false;
//   bool _isLoading = false;

//   // Prices come dynamically from selectedItems
//   double _comprehensiveReportPrice = 0.0;
//   double _socialMediaReportPrice = 0.0;

//   void _showError(String msg) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
//   }

//   @override
//   void initState() {
//     super.initState();

//     final comprehensiveItem = widget.selectedItems?.firstWhere(
//       (item) => item['key'] == 'haComprehensiveReport',
//       orElse: () => {},
//     );

//     final socialMediaItem = widget.selectedItems?.firstWhere(
//       (item) => item['key'] == 'haSocialMediaReport',
//       orElse: () => {},
//     );

//     _comprehensiveReportPrice = comprehensiveItem?['price']?.toDouble() ?? 0.0;
//     _socialMediaReportPrice = socialMediaItem?['price']?.toDouble() ?? 0.0;

//     _comprehensiveReport =
//         comprehensiveItem != null && (comprehensiveItem['count'] == 1);
//     _socialMediaReport =
//         socialMediaItem != null && (socialMediaItem['count'] == 1);
//     print(widget.email);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final indicatorItems = widget.selectedItems
//             ?.where((item) =>
//                 item['key'] != 'haComprehensiveReport' &&
//                 item['key'] != 'haSocialMediaReport')
//             .toList() ??
//         [];

//     final double indicatorsTotal = indicatorItems.fold<double>(
//       0.0,
//       (sum, item) =>
//           sum +
//           ((item['price']?.toDouble() ?? 0.0) *
//               (item['count']?.toDouble() ?? 1.0)),
//     );

//     final double grandTotal =
//         (_comprehensiveReport ? _comprehensiveReportPrice : indicatorsTotal) +
//             (_socialMediaReport ? _socialMediaReportPrice : 0.0);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Order Confirmation'),
//         backgroundColor: COLOR_PRIMARY,
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : Padding(
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 children: [
//                   if (!_comprehensiveReport)
//                     _buildIndicatorsCard(indicatorItems),
//                   if (_comprehensiveReport) _buildComprehensiveCard(),
//                   SizedBox(height: 12),
//                   _buildCheckboxes(),
//                   _buildTotalCard(grandTotal),
//                   Spacer(),
//                   ElevatedButton(
//                     onPressed: () => _showConfirmation(
//                       context,
//                     ),
//                     child: Text('CONFIRM ORDER'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: COLOR_PRIMARY,
//                       minimumSize: Size(double.infinity, 50),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }

//   Widget _buildIndicatorsCard(List<Map<String, dynamic>> indicators) {
//     return SizedBox(
//       height: 300,
//       child: Card(
//         child: Padding(
//           padding: EdgeInsets.all(12),
//           child: Column(
//             children: [
//               Text('Selected Indicators',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//               SizedBox(height: 8),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: indicators.length,
//                   itemBuilder: (context, index) {
//                     final item = indicators[index];
//                     return ListTile(
//                       title:
//                           Text(item['label'], style: TextStyle(fontSize: 14)),
//                       trailing: Text('\$${item['price']}',
//                           style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.green)),
//                     );
//                   },
//                 ),
//               ),
//               Divider(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Subtotal:', style: TextStyle(fontSize: 14)),
//                   Text(
//                     '\$${widget.selectedItems?.where((item) => item['key'] != 'haComprehensiveReport' && item['key'] != 'haSocialMediaReport' && (item['count'] ?? 0) > 0).fold<double>(
//                           0.0,
//                           (sum, item) =>
//                               sum + (item['price']?.toDouble() ?? 0.0),
//                         ).toStringAsFixed(2) ?? "0.00"}',
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.green,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildComprehensiveCard() {
//     return SizedBox(
//       height: 300,
//       child: Card(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.assignment, size: 50, color: Colors.blue),
//               SizedBox(height: 16),
//               Text('Comprehensive Report',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//               SizedBox(height: 8),
//               Text('Full detailed report including all indicators'),
//               SizedBox(height: 8),
//               Text('\$${_comprehensiveReportPrice.toStringAsFixed(2)}',
//                   style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.green,
//                       fontWeight: FontWeight.bold)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCheckboxes() {
//     return Column(
//       children: [
//         Card(
//           child: CheckboxListTile(
//             activeColor: Colors.white,
//             checkColor: COLOR_PRIMARY,
//             title: Text(
//               'Comprehensive Report',
//               style: TextStyle(
//                   color: _comprehensiveReport ? COLOR_PRIMARY : DARK_BG_COLOR,
//                   fontWeight: FontWeight.bold),
//             ),
//             subtitle: Text(
//               _comprehensiveReport
//                   ? 'Selected (\$${_comprehensiveReportPrice.toStringAsFixed(2)})'
//                   : 'Replace indicators with full report',
//               style: TextStyle(
//                   color: GREY_TEXT_COLOR,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 12),
//             ),
//             value: _comprehensiveReport,
//             onChanged: (val) =>
//                 setState(() => _comprehensiveReport = val ?? false),
//             secondary: Icon(
//               Icons.assignment,
//               color: COLOR_GREEEN_TEXT,
//             ),
//           ),
//         ),
//         Card(
//           child: CheckboxListTile(
//             activeColor: Colors.white,
//             checkColor: COLOR_PRIMARY,
//             title: Text(
//               'Social Media Report',
//               style: TextStyle(
//                   color: _socialMediaReport ? COLOR_PRIMARY : DARK_BG_COLOR,
//                   fontWeight: FontWeight.bold),
//             ),
//             subtitle: Text(
//               '\$${_socialMediaReportPrice.toStringAsFixed(2)} • Shared within 24 hours',
//               style: TextStyle(
//                   color: GREY_TEXT_COLOR,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 12),
//             ),
//             value: _socialMediaReport,
//             onChanged: (val) =>
//                 setState(() => _socialMediaReport = val ?? false),
//             secondary: Icon(
//               Icons.share_outlined,
//               color: COLOR_PRIMARY,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildTotalCard(double grandTotal) {
//     final double indicatorsTotal = widget.selectedItems
//             ?.where((item) =>
//                 item['key'] != 'haComprehensiveReport' &&
//                 item['key'] != 'haSocialMediaReport' &&
//                 (item['count'] ?? 0) > 0)
//             .fold<double>(
//               0.0,
//               (sum, item) => sum + (item['price']?.toDouble() ?? 0.0),
//             ) ??
//         0.0;

//     final double total =
//         (_comprehensiveReport ? _comprehensiveReportPrice : indicatorsTotal) +
//             (_socialMediaReport ? _socialMediaReportPrice : 0.0);

//     return Card(
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             if (_comprehensiveReport)
//               _buildPriceRow(
//                 'Comprehensive Report:',
//                 _comprehensiveReportPrice.toDouble(),
//               ),
//             if (!_comprehensiveReport)
//               _buildPriceRow(
//                 'Indicators Total:',
//                 indicatorsTotal,
//               ),
//             if (_socialMediaReport)
//               _buildPriceRow(
//                 'Social Media Report:',
//                 _socialMediaReportPrice.toDouble(),
//               ),
//             Divider(),
//             _buildPriceRow(
//               'TOTAL:',
//               total,
//               isBold: true,
//               color: Colors.green,
//               fontSize: 18,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildPriceRow(String label, double value,
//       {bool isBold = false, Color color = Colors.black, double fontSize = 14}) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(label,
//             style: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: isBold ? FontWeight.bold : null)),
//         Text('\$${value.toStringAsFixed(2)}',
//             style: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: isBold ? FontWeight.bold : null,
//                 color: color)),
//       ],
//     );
//   }

//   void _showConfirmation(BuildContext context) {
//     TextEditingController defaultemailController =
//         TextEditingController(text: widget.useremail ?? '');
//     var email = defaultemailController.text;

//     // ✅ Calculate total price
//     final double indicatorsTotal = widget.selectedItems
//             ?.where((item) =>
//                 item['key'] != 'haComprehensiveReport' &&
//                 item['key'] != 'haSocialMediaReport' &&
//                 (item['count'] ?? 0) > 0)
//             .fold<double>(
//               0.0,
//               (sum, item) => sum + (item['price']?.toDouble() ?? 0.0),
//             ) ??
//         0.0;

//     final double total =
//         (_comprehensiveReport ? _comprehensiveReportPrice : indicatorsTotal) +
//             (_socialMediaReport ? _socialMediaReportPrice : 0.0);

//     showDialog(
//       context: context,
//       builder: (_) => Dialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         child: Container(
//           width: 350,
//           padding: EdgeInsets.all(20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text('Confirm Payment',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//               SizedBox(height: 8),
//               Text(
//                 'All Reports Will be Sent to this Email',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.green,
//                 ),
//               ),
//               SizedBox(height: 8),
//               AppTextField(
//                 name: 'email',
//                 showTitle: true,
//                 maxline: 1,
//                 rectangleborder: true,
//                 controller: defaultemailController,
//                 validator: FormBuilderValidators.compose([
//                   FormBuilderValidators.required(),
//                   FormBuilderValidators.email(),
//                 ]),
//                 placeholder: "Email",
//               ),
//               SizedBox(height: 8),
//               Text('You are purchasing:'),
//               SizedBox(height: 8),
//               Text(
//                 _comprehensiveReport
//                     ? 'Comprehensive Report'
//                     : '${widget.selectedItems?.where((item) => item['key'] != 'haComprehensiveReport' && item['key'] != 'haSocialMediaReport' && (item['count'] ?? 0) > 0).length ?? 0} Indicators',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               if (_socialMediaReport)
//                 Text('+ Social Media Report',
//                     style: TextStyle(fontWeight: FontWeight.bold)),
//               Divider(height: 30),
//               Text('Total Amount:'),
//               Text(
//                 '\$${total.toStringAsFixed(2)}',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.green,
//                 ),
//               ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextButton(
//                     onPressed: () => Navigator.pop(context),
//                     child: Text(
//                       'CANCEL',
//                       style: TextStyle(color: COLOR_PRIMARY),
//                     ),
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: COLOR_PRIMARY),
//                     onPressed: () async {
//                       Navigator.pop(context);
//                       setState(() => _isLoading = true);

//                       final paymentIntentId = await StripeService.instance
//                           .makePayment(amount: total.round()
//                               // Convert dollars to cents
//                               );

//                       if (paymentIntentId != null) {
//                         await _callSelectedReports(
//                           widget.tahoeId ?? '',
//                           widget.email ?? '',
//                           defaultemailController.text,
//                           widget.age ?? '',
//                           widget.firstname ?? '',
//                           widget.lastname ?? '',
//                           widget.isMob,
//                           paymentIntentId,
//                           total.round(),
//                           _socialMediaReport,
//                           _comprehensiveReport,
//                           _socialMediaReport,
//                           widget.selectedItems!,
//                         );
//                       }

//                       setState(() => _isLoading = false);
//                     },
//                     child: Text('CONFIRM'),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _callSelectedReports(
//     String id,
//     String email,
//     String useremail,
//     String age,
//     String firstname,
//     String lastname,
//     int isMob,
//     String intentId,
//     int amount,
//     bool isSocialMediaReport,
//     bool comprehensiveReportSelected,
//     bool socialMediaReportSelected,
//     List<Map<String, dynamic>> selectedItems,
//   ) async {
//     final token = await AppPreferences.getAuthToken();
//     final headers = {'Authorization': 'Bearer $token'};
//     final dio = Dio()..options.headers = headers;

// // Add all other selected indicators (filter only selected items)
//     final selectedTypes = widget.selectedItems!
//         .where((item) => item['isSelected'] == true)
//         .map((item) => {
//               "label": item['label'],
//               "key": item['key'],
//               "price": item['price'],
//               "count": 0,
//             })
//         .toList();

// // Check if types is empty before API call
//     if (selectedTypes.isEmpty) {
//       // Show error or prompt user to select at least one indicator/report
//       print('❌ Please select at least one report type.');
//       return;
//     }

// // Build and send payload
//     final payload = {
//       "email": email,
//       "user_email": useremail,
//       "tahoe_id": id,
//       "first_name": firstname,
//       "last_name": lastname,
//       "age": age,
//       "is_mob": isMob,
//       "amount": amount,
//       "intent_id": intentId,
//       "social_media_report": _socialMediaReport ? 1 : 0,
//       "types": selectedTypes,
//     };

//     print('Payload sent: $payload');

//     try {
//       final response = await dio.post(
//         'https://server.testlinkwebsitespace.com/virtual-pi-backend/public/api/generate-report',
//         data: payload,
//       );

//       if (response.statusCode == 200 && response.data['status'] == true) {
//         print('✅ Report success');
//         ScaffoldMessenger.of(Get.context!).showSnackBar(
//           SnackBar(
//             backgroundColor: Colors.green,
//             content:
//                 Text(response.data['message'] ?? 'Reports sent successfully.'),
//           ),
//         );
//       } else {
//         print('❌ Report failed: ${response.data['message']}');
//         _showError(
//             'Report failed: ${response.data['message'] ?? 'Unknown error'}');
//       }
//     } catch (e) {
//       _showError('Request error: $e');
//       print('Request error: $e');
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/services/app_preferences.dart';
import 'package:virualapi/services/stripe_service.dart';
import 'package:virualapi/widgets/text_field.dart'; // Your custom text field widget

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

  const ConfirmScreen({
    this.selectedItems,
    this.totalPrice,
    this.intentId,
    this.address,
    this.email,
    this.age,
    this.dob,
    this.firstname,
    this.lastname,
    this.useremail,
    this.tahoeId,
  });

  @override
  _ConfirmScreenState createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  bool _comprehensiveReport = false;
  bool _socialMediaReport = false;
  bool _isLoading = false;

  late List<Map<String, dynamic>> _localSelectedItems;

  double _comprehensiveReportPrice = 0.0;
  double _socialMediaReportPrice = 0.0;

  @override
  void initState() {
    super.initState();

    // Make a local copy of selectedItems with isSelected flag
    _localSelectedItems = widget.selectedItems?.map((item) {
          return {
            ...item,
            'isSelected': false,
          };
        }).toList() ??
        [];

    // Extract prices of special reports from original list
    final comp = widget.selectedItems?.firstWhere(
      (item) => item['key'] == 'haComprehensiveReport',
      orElse: () => {},
    );
    final social = widget.selectedItems?.firstWhere(
      (item) => item['key'] == 'haSocialMediaReport',
      orElse: () => {},
    );

    _comprehensiveReportPrice = (comp?['price'] ?? 0).toDouble();
    _socialMediaReportPrice = (social?['price'] ?? 0).toDouble();

    // Initialize comprehensive/social report flags as false or true if you want
    _comprehensiveReport = false;
    _socialMediaReport = false;
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.fixed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Filter out the special reports from the indicator list
    final indicators = _localSelectedItems
        .where((item) =>
            item['key'] != 'haComprehensiveReport' &&
            item['key'] != 'haSocialMediaReport')
        .toList();

    // Calculate total price for selected indicators
    final indicatorsTotal = indicators.fold<double>(
      0.0,
      (sum, item) =>
          sum +
          ((item['isSelected'] == true ? 1 : 0) *
              (item['price']?.toDouble() ?? 0.0)),
    );

    final grandTotal =
        (_comprehensiveReport ? _comprehensiveReportPrice : indicatorsTotal) +
            (_socialMediaReport ? _socialMediaReportPrice : 0.0);

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Confirmation'),
        backgroundColor: COLOR_PRIMARY,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  if (!_comprehensiveReport) _buildIndicatorsCard(indicators),
                  if (_comprehensiveReport) _buildComprehensiveCard(),
                  SizedBox(height: 12),
                  _buildCheckboxes(),
                  _buildTotalCard(grandTotal),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () => _showConfirmation(context),
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

  Widget _buildIndicatorsCard(List<Map<String, dynamic>> indicators) {
    return SizedBox(
      height: 300,
      child: Card(
        child: Column(
          children: [
            Text('Select Indicators',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: indicators.length,
                itemBuilder: (context, index) {
                  final item = indicators[index];
                  return CheckboxListTile(
                    activeColor: COLOR_PRIMARY,
                    title: Text(item['label'],
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: item['isSelected']
                                ? COLOR_PRIMARY
                                : DARK_BG_COLOR)),
                    value: item['isSelected'] ?? false,
                    onChanged: (val) {
                      setState(() {
                        item['isSelected'] = val ?? false;
                      });
                    },
                    secondary: Text('\$${item['price']}',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComprehensiveCard() {
    return SizedBox(
      height: 200,
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
              Text('\$${_comprehensiveReportPrice.toStringAsFixed(2)}',
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
            activeColor: COLOR_PRIMARY,
            checkColor: Colors.white,
            title: Text(
              'Comprehensive Report',
              style: TextStyle(
                  color: _comprehensiveReport ? COLOR_PRIMARY : DARK_BG_COLOR,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              _comprehensiveReport
                  ? 'Selected (\$${_comprehensiveReportPrice.toStringAsFixed(2)})'
                  : 'Replace indicators with full report',
              style: TextStyle(
                  color: GREY_TEXT_COLOR,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
            value: _comprehensiveReport,
            onChanged: (val) =>
                setState(() => _comprehensiveReport = val ?? false),
            secondary: Icon(
              Icons.assignment,
              color: COLOR_GREEEN_TEXT,
            ),
          ),
        ),
        Card(
          child: CheckboxListTile(
            activeColor: COLOR_PRIMARY,
            checkColor: Colors.white,
            title: Text(
              'Social Media Report',
              style: TextStyle(
                  color: _socialMediaReport ? COLOR_PRIMARY : DARK_BG_COLOR,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '\$${_socialMediaReportPrice.toStringAsFixed(2)} • Shared within 24 hours',
              style: TextStyle(
                  color: GREY_TEXT_COLOR,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
            value: _socialMediaReport,
            onChanged: (val) =>
                setState(() => _socialMediaReport = val ?? false),
            secondary: Icon(
              Icons.share_outlined,
              color: COLOR_PRIMARY,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTotalCard(double grandTotal) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            if (_comprehensiveReport)
              _buildPriceRow(
                  'Comprehensive Report:', _comprehensiveReportPrice),
            if (!_comprehensiveReport)
              _buildPriceRow(
                  'Indicators Total:',
                  _localSelectedItems
                      .where((item) => item['isSelected'] == true)
                      .fold<double>(
                        0,
                        (sum, item) => sum + (item['price']?.toDouble() ?? 0),
                      )),
            if (_socialMediaReport)
              _buildPriceRow('Social Media Report:', _socialMediaReportPrice),
            Divider(),
            _buildPriceRow('TOTAL:', grandTotal,
                isBold: true, color: Colors.green, fontSize: 18),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceRow(String label, double value,
      {bool isBold = false, Color color = Colors.black, double fontSize = 14}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: fontSize,
                fontWeight: isBold ? FontWeight.bold : null)),
        Text('\$${value.toStringAsFixed(2)}',
            style: TextStyle(
                fontSize: fontSize,
                fontWeight: isBold ? FontWeight.bold : null,
                color: color)),
      ],
    );
  }

  void _showConfirmation(BuildContext context) {
    TextEditingController defaultemailController =
        TextEditingController(text: widget.useremail ?? '');

    final selectedIndicatorsCount =
        _localSelectedItems.where((item) => item['isSelected'] == true).length;

    // Check if at least one report is selected
    if (!_comprehensiveReport &&
        !_socialMediaReport &&
        selectedIndicatorsCount == 0) {
      _showError(
          '❌ Please select at least one report before confirming the order.');
      return; // Don't open confirmation dialog
    }

    final indicatorsTotal = _localSelectedItems
        .where((item) => item['isSelected'] == true)
        .fold<double>(
          0,
          (sum, item) => sum + (item['price']?.toDouble() ?? 0),
        );

    final total =
        (_comprehensiveReport ? _comprehensiveReportPrice : indicatorsTotal) +
            (_socialMediaReport ? _socialMediaReportPrice : 0);

    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          width: 350,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Confirm Payment',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text(
                'All Reports Will be Sent to this Email',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 8),
              AppTextField(
                name: 'email',
                showTitle: true,
                maxline: 1,
                rectangleborder: true,
                controller: defaultemailController,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Email is required';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(val)) {
                    return 'Invalid email';
                  }
                  return null;
                },
                placeholder: "Email",
              ),
              SizedBox(height: 8),
              Text('You are purchasing:'),
              SizedBox(height: 8),
              Text(
                _comprehensiveReport
                    ? 'Comprehensive Report'
                    : '${_localSelectedItems.where((item) => item['isSelected'] == true).length} Indicators',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              if (_socialMediaReport)
                Text('+ Social Media Report',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              Divider(height: 30),
              Text('Total Amount:'),
              Text(
                '\$${total.toStringAsFixed(2)}',
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
                    child: Text(
                      'CANCEL',
                      style: TextStyle(color: COLOR_PRIMARY),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: COLOR_PRIMARY),
                    onPressed: () async {
                      Navigator.pop(context);
                      setState(() => _isLoading = true);

                      final paymentIntentId = await StripeService.instance
                          .makePayment(amount: total.round() /* in cents */);

                      if (paymentIntentId != null) {
                        await _callSelectedReports(
                          widget.tahoeId ?? '',
                          widget.email ?? '',
                          defaultemailController.text,
                          widget.age ?? '',
                          widget.firstname ?? '',
                          widget.lastname ?? '',
                          widget.address ?? '',
                          widget.isMob,
                          paymentIntentId,
                          total.round(),
                          _socialMediaReport,
                          _comprehensiveReport,
                          _localSelectedItems,
                        );
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

  Future<void> _callSelectedReports(
    String id,
    String email,
    String useremail,
    String age,
    String firstname,
    String lastname,
    String address,
    int isMob,
    String intentId,
    int amount,
    bool isSocialMediaReport,
    bool comprehensiveReportSelected,
    List<Map<String, dynamic>> selectedItems,
  ) async {
    final token = await AppPreferences.getAuthToken();
    final headers = {'Authorization': 'Bearer $token'};
    final dio = Dio()..options.headers = headers;

    // Build types list from selections
    List<Map<String, dynamic>> types = [];

    if (comprehensiveReportSelected) {
      types.add({
        "label": "Comprehensive Report",
        "key": "haComprehensiveReport",
        "price": _comprehensiveReportPrice,
        "count": 0,
      });
    } else {
      // Add individually selected indicators only if not comprehensive
      types.addAll(selectedItems
          .where((item) => item['isSelected'] == true)
          .map((item) => {
                "label": item['label'],
                "key": item['key'],
                "price": item['price'],
                "count": 0,
              }));
    }

    if (isSocialMediaReport) {
      types.add({
        "label": "Social Media Report",
        "key": "haSocialMediaReport",
        "price": _socialMediaReportPrice,
        "count": 0,
      });
    }

    if (types.isEmpty) {
      _showError('❌ Please select at least one report type.');
      return;
    }

    final payload = {
      "email": email,
      "user_email": useremail,
      "tahoe_id": id,
      "first_name": firstname,
      "last_name": lastname,
      "full_address": address,
      "age": age,
      "is_mob": isMob,
      "amount": amount,
      "intent_id": intentId,
      "social_media_report": isSocialMediaReport ? 1 : 0,
      "types": types,
    };

    print('Payload sent: $payload');

    try {
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
        Future.delayed(Duration(seconds: 2), () {
          Get.offAllNamed('/home');
        });
      } else {
        print('❌ Report failed: ${response.data['message']}');
        _showError(
            'Report failed: ${response.data['message'] ?? 'Unknown error'}');
      }
    } catch (e) {
      _showError('Request error: $e');
      print('Request error: $e');
    }
  }
}
