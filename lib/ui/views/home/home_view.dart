import 'package:api_crud_app/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: ((context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home (GET API)'),
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Welcome to Home View'),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //viewModel.logout();
                    },
                    child: const Text('Logout'),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
