import 'package:fluro/fluro.dart';
import 'package:fluro/src/fluro_router.dart';
import 'package:flutter_chat/Modules/login/pages/login_main.dart';

import '../../routers/i_router.dart';

class LoginRouter extends IRouterProvider {
  static String loginPage = 'login/index';

  @override
  void initRouter(FluroRouter router) {
    router.define(loginPage,
        handler: Handler(handlerFunc: (_, __) => LoginMain()));
  }
}
