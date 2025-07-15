import 'package:flutter_dotenv/flutter_dotenv.dart';

final stripePublishKey = dotenv.env['STRIPE_PUBLISHABLE_KEY'] ?? '';
final stripeSecretKey = dotenv.env['STRIPE_SECRET_KEY'] ?? '';
