import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

// class StripeService {
//   StripeService._();

//   static final StripeService instance = StripeService._();

//   Future<void> makePayment({
//     required int amount,
//     String currency = 'usd',
//   }) async {
//     try {
//       // 1. Create PaymentIntent on backend
//       String? paymentIntentClientSecret =
//           await _createPaymentIntent(amount, currency);
//       if (paymentIntentClientSecret == null) return;

//       // 2. Initialize Payment Sheet
//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: paymentIntentClientSecret,
//           merchantDisplayName: "VirualPi",
//         ),
//       );

//       // 3. Present Payment Sheet
//       await Stripe.instance.presentPaymentSheet();
//       print('✅ Payment completed successfully.');
//     } catch (e) {
//       print('❌ Payment error: $e');
//     }
//   }

//   Future<String?> _createPaymentIntent(int amount, String currency) async {
//     try {
//       final Dio dio = Dio();

//       final response = await dio.post(
//         'https://api.stripe.com/v1/payment_intents',
//         data: {
//           'amount': (amount * 100).toString(), // convert to cents
//           'currency': currency,
//           'payment_method_types[]': 'card',
//         },
//         options: Options(
//           contentType: Headers.formUrlEncodedContentType,
//           headers: {
//             'Authorization': 'Bearer $StripeSecret',
//             'Content-Type': 'application/x-www-form-urlencoded',
//           },
//         ),
//       );

//       if (response.data != null) {
//         return response.data['client_secret'];
//       }
//       return null;
//     } catch (e) {
//       print('❌ Failed to create PaymentIntent: $e');
//       return null;
//     }
//   }
// }

// class PaymentIntentData {
//   final String clientSecret;
//   final String id;

//   PaymentIntentData({required this.clientSecret, required this.id});
// }

// class StripeService {
//   StripeService._();

//   static final StripeService instance = StripeService._();

//   Future<void> makePayment({
//     required int amount,
//     required String userEmail,
//     required String tahoeId,
//     String currency = 'usd',
//   }) async {
//     try {
//       // 1. Create PaymentIntent on backend
//       PaymentIntentData? paymentIntentData =
//           await _createPaymentIntent(amount, currency);
//       if (paymentIntentData == null) return;

//       print('PaymentIntent ID: ${paymentIntentData.id}');

//       // 2. Initialize Payment Sheet
//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: paymentIntentData.clientSecret,
//           merchantDisplayName: "VirualPi",
//         ),
//       );

//       // 3. Present Payment Sheet
//       await Stripe.instance.presentPaymentSheet();
//       print('✅ Payment completed successfully.');

//       // Now you have PaymentIntent ID here to save or log
//       // You can send it to your backend or store locally if needed
//     } catch (e) {
//       print('❌ Payment error: $e');
//     }
//   }

//   Future<PaymentIntentData?> _createPaymentIntent(
//       int amount, String currency) async {
//     try {
//       final Dio dio = Dio();

//       final response = await dio.post(
//         'https://api.stripe.com/v1/payment_intents',
//         data: {
//           'amount': (amount * 100).toString(), // convert to cents
//           'currency': currency,
//           'payment_method_types[]': 'card',
//         },
//         options: Options(
//           contentType: Headers.formUrlEncodedContentType,
//           headers: {
//             'Authorization': 'Bearer $StripeSecret',
//             'Content-Type': 'application/x-www-form-urlencoded',
//           },
//         ),
//       );

//       if (response.data != null) {
//         return PaymentIntentData(
//           clientSecret: response.data['client_secret'],
//           id: response.data['id'],
//         );
//       }
//       return null;
//     } catch (e) {
//       print('❌ Failed to create PaymentIntent: $e');
//       return null;
//     }
//   }
// }

import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
// Contains StripeSecret

class PaymentIntentData {
  final String clientSecret;
  final String id;

  PaymentIntentData({required this.clientSecret, required this.id});
}

class StripeService {
  StripeService._();

  static final StripeService instance = StripeService._();
  final secretKey = dotenv.env['STRIPE_SECRET_KEY'] ?? '';

  Future<String?> makePayment({
    required int amount,
    String currency = 'usd',
  }) async {
    try {
      print(secretKey);
      // Step 1: Create PaymentIntent
      PaymentIntentData? paymentIntentData =
          await _createPaymentIntent(amount, currency);
      if (paymentIntentData == null) return null;

      print('🧾 PaymentIntent ID: ${paymentIntentData.id}');

      // Step 2: Init Payment Sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData.clientSecret,
          merchantDisplayName: "VirualPi",
        ),
      );

      // Step 3: Present Payment Sheet
      await Stripe.instance.presentPaymentSheet();
      print('✅ Payment completed successfully.');

      // Return the PaymentIntent ID for logging or backend use
      return paymentIntentData.id;
    } catch (e) {
      print('❌ Payment error: $e');
      return null;
    }
  }

  Future<PaymentIntentData?> _createPaymentIntent(
      int amount, String currency) async {
    try {
      final dio = Dio();

      final response = await dio.post(
        'https://api.stripe.com/v1/payment_intents',
        data: {
          'amount': (amount * 100).toString(), // amount in cents
          'currency': currency,
          'payment_method_types[]': 'card',
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization': 'Bearer $secretKey',
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
      );

      if (response.data != null) {
        return PaymentIntentData(
          clientSecret: response.data['client_secret'],
          id: response.data['id'],
        );
      }
      return null;
    } catch (e) {
      print('❌ Failed to create PaymentIntent: $e');
      return null;
    }
  }
}
