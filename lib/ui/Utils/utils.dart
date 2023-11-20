import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class Utils {
  static snackBar(String title, String message, ContentType contentType,
      BuildContext context) {
    final snackBar = SnackBar(
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
            title: title, message: message, contentType: contentType));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
