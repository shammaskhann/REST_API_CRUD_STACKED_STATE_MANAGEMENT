import 'dart:developer';

import 'package:api_crud_app/ui/Utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.router.dart';

class SignUpViewModel extends BaseViewModel {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObsecure = true;
  NavigationService navigationService = NavigationService();

  void togglePasswordVisibility() {
    isObsecure = !isObsecure;
    notifyListeners();
  }

  signUp(context) async {
    try {
      Response response =
          await http.post(Uri.parse('https://reqres.in/api/register'), body: {
        'email': emailController.text,
        'password': passwordController.text,
      });
      if (response.statusCode == 200) {
        log(response.body);
        Utils.snackBar('Sign Up Sucessfully', context);
        navigationService.replaceWith(Routes.loginView);
      } else {
        log(response.body);
        Utils.snackBar('Sign Up Failed', context);
      }
    } catch (e) {
      Utils.snackBar('Error: $e', context);
      log(e.toString());
    }
  }
}
