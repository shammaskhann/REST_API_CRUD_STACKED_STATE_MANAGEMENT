import 'package:api_crud_app/ui/views/signup/signup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../widgets/CustomTextField.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    DialogService dialogService = DialogService();
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => SignUpViewModel(),
        builder: (context, viewModel, child) => Scaffold(
            appBar: AppBar(
              title: const Text('Sign Up (POST API)'),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 80, left: 20, right: 20, bottom: 20),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/splash/rest-api-icon.svg',
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        dialogService.showDialog(
                          title: 'ID & PASS REGISTER',
                          description:
                              'Email: eve.holt@reqres.in \nPassword: pistol',
                          buttonTitle: 'GOT IT !!',
                        );
                      },
                      child: const Text(
                        "Read me",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.underline,
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: key,
                    child: Column(
                      children: [
                        CustomTextField(
                          hintText: 'Email',
                          controller: viewModel.emailController,
                          isObsecure: false,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          hintText: 'Password',
                          controller: viewModel.passwordController,
                          isObsecure: viewModel.isObsecure,
                          togglePasswordVisibility: () =>
                              viewModel.togglePasswordVisibility(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: InkWell(
                            onTap: () {
                              viewModel.signUp(context);
                            },
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(colors: [
                                  Colors.blue,
                                  Colors.blueAccent,
                                ]),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue.withOpacity(0.5),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  "SIGN UP ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
