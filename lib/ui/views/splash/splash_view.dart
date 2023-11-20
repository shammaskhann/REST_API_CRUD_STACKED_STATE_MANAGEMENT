import 'package:api_crud_app/ui/views/splash/splash_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        onViewModelReady: (viewmodel) => viewmodel.handleStartUpLogic(),
        viewModelBuilder: () => SplashViewModel(),
        builder: (viewmodel, context, child) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: SvgPicture.asset('assets/splash/rest-api-icon.svg'),
              ));
        });
  }
}
