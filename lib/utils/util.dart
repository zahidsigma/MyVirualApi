import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class Util {
  static bool isEmailValid(email) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  static bool isValidPhoneNumber(String username) =>
      RegExp(r'^\(?(\d{3,4})\)?[- ]?(\d{3})[- ]?(\d{4,5})$').hasMatch(username);

  static String getPastDate({int years = 2}) {
    DateTime currentDate = DateTime.now();

    // Calculate the date two years ago
    DateTime twoYearsAgo = currentDate.subtract(Duration(days: 365 * years));

    // Format the date as a string
    String dateStr =
        '${twoYearsAgo.year}-${twoYearsAgo.month}-${twoYearsAgo.day}';
    return dateStr;
  }

  static String timeStampDateFormat(timestamp, {format = 'dd-MMM-yyyy'}) =>
      DateFormat(format)
          .format(DateTime.fromMillisecondsSinceEpoch(timestamp, isUtc: true));

  static Color getLightColor(Color color, {double factor = 0.65}) {
    // Ensure the factor is within the range 0.0 to 1.0
    factor = factor.clamp(0.0, 1.0);

    // Interpolate between the original color and white
    int red = (color.red + (255 - color.red) * factor).round();
    int green = (color.green + (255 - color.green) * factor).round();
    int blue = (color.blue + (255 - color.blue) * factor).round();

    // Return the new color
    return Color.fromARGB(color.alpha, red, green, blue);
  }

  static double sumAmounts(List<Map<String, dynamic>> transactions,
      {String key = "amount"}) {
    double sum = 0;
    for (var transaction in transactions) {
      sum += transaction[key];
    }
    return sum;
  }

  static void dialNumber(String phoneNumber) async {
    var url = Uri.parse("tel:${phoneNumber}");
    var canLaunch = await canLaunchUrl(url);
    if (canLaunch) {
      await launchUrl(url);
    } else {
      print('Could not launch $url');
    }
  }

  static String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
  static bool containsOnlyDigits(String str) {
    final RegExp regex = RegExp(r'^[0-9]+$');
    return regex.hasMatch(str);
  }

  static bool hasCountryCode(String phoneNumber) {
    final RegExp countryCodeRegex = RegExp(r'^\d{1,3}\s');
    return countryCodeRegex.hasMatch(phoneNumber);
  }

  static Future<void> showConfirmationDialog(BuildContext context, title,
      message, agreeText, disagreeText, Function() callback,
      {bool isConfirmation = true}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button to close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            textAlign: isConfirmation ? TextAlign.left : TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  message,
                  textAlign: isConfirmation ? TextAlign.left : TextAlign.center,
                ),
              ],
            ),
          ),
          actions: !isConfirmation
              ? [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  )
                ]
              : [
                  ElevatedButton(
                    child: Text(disagreeText),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isConfirmation ? Colors.red : COLOR_PRIMARY,
                    ),
                    child: Text(agreeText),
                    onPressed: () {
                      // Perform action here
                      // For example, you can delete something or proceed with an operation
                      // After performing the action, close the dialog
                      Navigator.of(context).pop();
                      callback();
                    },
                  ),
                  if (!isConfirmation)
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isConfirmation ? Colors.red : COLOR_PRIMARY,
                        ),
                        child: Text(agreeText),
                        onPressed: () {
                          // Perform action here
                          // For example, you can delete something or proceed with an operation
                          // After performing the action, close the dialog
                          Navigator.of(context).pop();
                          callback();
                        },
                      ),
                    ),
                ],
        );
      },
    );
  }
}
