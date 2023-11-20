import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.router.dart';

class SplashViewModel extends BaseViewModel {
  NavigationService navigationService = NavigationService();
  Future handleStartUpLogic() async {
    await Future.delayed(const Duration(seconds: 3));
    navigationService.replaceWithLoginView();
    // Navigate to the login view
  }
}
