import 'dart:developer';

import 'package:api_crud_app/app/app.router.dart';
import 'package:api_crud_app/ui/Utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isObsecure = true;
  NavigationService navigationService = NavigationService();

  void togglePasswordVisibility() {
    isObsecure = !isObsecure;
    rebuildUi();
  }

  login(key, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      log('validate success');
      try {
        Response response = await http.post(
          Uri.parse('https://reqres.in/api/login'),
          body: {
            'email': emailController.text,
            'password': passwordController.text,
          },
        );
        if (response.statusCode == 200) {
          log(response.body);
          Utils.snackBar('Login Sucessfully', context);
          prefs.setString('token', response.body);
          navigationService.replaceWithHomeView();
        } else {
          log(response.body);
          Utils.snackBar('Login Failed', context);
        }
      } catch (e) {
        Utils.snackBar('Error: $e', context);
        log(e.toString());
      }
      return true;
    } else {
      Utils.snackBar('Enter Valid Email or Passowrd', context);
      return false;
    }
  }

  navtoSignUpPage() {
    navigationService.navigateTo(Routes.signupView);
  }
}
