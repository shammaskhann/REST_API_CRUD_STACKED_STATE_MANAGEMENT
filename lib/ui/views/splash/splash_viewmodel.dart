import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.router.dart';

class SplashViewModel extends BaseViewModel {
  NavigationService navigationService = NavigationService();

  Future handleStartUpLogic() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    await Future.delayed(const Duration(seconds: 3));
    if (token != null) {
      navigationService.replaceWithHomeView();
      // Navigate to the login view
    } else {
      navigationService.replaceWithLoginView();
    }
  }
}
