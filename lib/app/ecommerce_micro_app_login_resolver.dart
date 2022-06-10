
import 'package:ecommerce_micro_core/ecommerce_micro_core.dart';

import 'pages/login_page.dart';

class MicroAppLoginResolver implements MicroApp {
  @override
  String get microAppName => 'micro_app_login';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
    '/login': (context, args) => LoginPage(),
  };
}
