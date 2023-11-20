import 'package:api_crud_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:api_crud_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:api_crud_app/ui/views/home/home_view.dart';
import 'package:api_crud_app/ui/views/login/login_view.dart';
import 'package:api_crud_app/ui/views/signup/signup_view.dart';
import 'package:api_crud_app/ui/views/splash/splash_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(
      page: LoginView,
    ),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: HomeView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
