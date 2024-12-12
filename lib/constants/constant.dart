// ignore: constant_identifier_names
import 'package:flutter/material.dart';

const COLOR_ACCENT = Color(0xFFEB8F07);
const COLOR_ACCENT_LIGHT = Color(0xFFf9ddb4);
const COLOR_BACKGROUND = Color(0xFF25566B);
const COLOR_PRIMARY_DARK = Color(0x00B761);
const COLOR_PRIMARY = Color(0xFF317183);
const FACEBOOK_BUTTON_COLOR = Color(0xFF415893);
const COUPON_BG_COLOR = Color(0xFFFCF8F3);
const DARK_BG_COLOR = Color(0xff121212);
const COUPON_DASH_COLOR = Color(0xFFCACFDA);
const GREY_TEXT_COLOR = Color(0xff5E5C5C);
const DarkContainerColor = Color(0xff26272C);
const DarkContainerBorderColor = Color(0xff515151);
const LIGHT_BACKGROUND_COLOR = Color(0xFFF7F8F9);
const COLOR_PRIMARY_Text = Color(0xff1B95AF);
const COLOR_GREEEN_TEXT = Color(0xff0FA958);
const COLOR_GRAY = Color(0xff747474);
const COLOR_BG_LIGHT = Color(0xFFfefefe);

const Duration buildDuration = Duration(milliseconds: 50);
const Duration transissionDuration = Duration(milliseconds: 500);
const Duration apiDataDuration = Duration(milliseconds: 1000);

final List<Map<String, dynamic>> onBoardingList = [
  {
    "title": "Virtual Healthcare",
    "content": "Quality healthcare starts with quality doctors.",
    "image": "assets/images/virtual_health_care.jpg",
  },
  {
    "title": "Online Prescriptions",
    "content":
        "Order medicines through our integrated online pharmacy. We will deliver to your doorstep.",
    "image": "assets/images/online_perscription.jpg",
  },
  {
    "title": "Medication Reminder",
    "content":
        "Recieve reminders about your medication and important care needs",
    "image": "assets/images/medical_reminder.jpg",
    "buttonText": "GET STARTED"
  }
];

final List<Map<String, dynamic>> bottomNavList = [
  {"icon": "home.png", "title": "Home"},
  {"icon": "treat.png", "title": "Treatments"},
  {"icon": "medi.png", "title": "Medication"},
  {"icon": "lab_report.png", "title": "Lab Tests"}
];
