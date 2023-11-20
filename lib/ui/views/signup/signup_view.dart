import 'package:api_crud_app/ui/views/signup/signup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => SignUpViewModel(),
        builder: (context, viewModel, child) => Scaffold(
              appBar: AppBar(
                title: const Text('Sign Up (POST API)'),
                centerTitle: true,
              ),
              body: const Center(
                child: Text('Sign Up'),
              ),
            ));
  }
}
