import 'dart:developer';

import 'package:api_crud_app/app/app.router.dart';
import 'package:api_crud_app/ui/Utils/utils.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:http/http.dart' as http;

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
          Utils.snackBar(
              'Congrats', 'Login Sucessfull', ContentType.success, context);
          navigationService.navigateTo(Routes.homeView);
        } else {
          log(response.body);
          Utils.snackBar('Error', 'Login Failed', ContentType.failure, context);
        }
      } catch (e) {
        log(e.toString());
      }
      return true;
    } else {
      key.currentState!.showSnackBar(
        const SnackBar(
          content: Text('Please Enter Email and Password'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }

  navtoSignUpPage() {
    navigationService.navigateTo(Routes.signupView);
  }
}
