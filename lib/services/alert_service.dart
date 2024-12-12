import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virualapi/utils/context_less_nav.dart';

class Alert {
//helper method to show alert dialog
  static showAlertDialog(BuildContext context, String title, String content,
      List<Widget>? actions) {
    // set up the AlertDialog

    actions ??= [
      TextButton(
        child: const Text('ok'),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ];

    if (Platform.isIOS) {
      CupertinoAlertDialog alert = CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: actions,
      );
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return alert;
          });
    } else {
      AlertDialog alert = AlertDialog(
          title: Text(title), content: Text(content), actions: actions);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }

  static showMessage(message) {
    ScaffoldMessenger.of(ContextLess.context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
