
import 'package:ecommerce_micro_app_login/app/pages/splash.dart';
import 'package:ecommerce_micro_core/ecommerce_micro_core.dart';

import 'pages/login_page.dart';

class EcommerceMicroAppLoginResolver implements MicroApp {
  @override
  String get microAppName => 'micro_app_login';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
    '/login': (context, args) => LoginPage(),
    '/splash':(context, args) => const SplashPage(),
  };
}
