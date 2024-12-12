import 'package:flutter/material.dart';

Size getScreenSize(BuildContext context) => MediaQuery.of(context).size;

double getScreenWidth(BuildContext context) => getScreenSize(context).width;
double getScreenHeight(BuildContext context) => getScreenSize(context).height;
