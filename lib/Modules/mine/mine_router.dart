import 'package:fluro/fluro.dart';
import 'package:flutter_chat/Modules/mine/pages/normal_page.dart';
import 'package:flutter_chat/Modules/mine/pages/settings_page.dart';
import 'package:flutter_chat/Modules/mine/pages/theme_page.dart';
import 'package:flutter_chat/routers/i_router.dart';

class MineRouter extends IRouterProvider {
  static String settingPage = '/mine/setting';
  static String themePage = '/mine/theme';
  static String normalPage = 'mine/normal';

  @override
  void initRouter(FluroRouter router) {
    router.define(settingPage,
        handler: Handler(handlerFunc: (_, __) => const SettingsPage()));
    router.define(themePage,
        handler: Handler(handlerFunc: (_, __) => const ThemePage()));
    router.define(normalPage,
        handler: Handler(handlerFunc: (_, __) => const NormalPage()));
  }
}
