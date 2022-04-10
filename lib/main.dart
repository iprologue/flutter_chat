import 'package:flutter/material.dart';
import 'package:flutter_chat/Modules/login/pages/login_main.dart';
import 'package:flutter_chat/Modules/login/provider/login_provider.dart';
import 'package:flutter_chat/routers/routers.dart';
import 'package:flutter_chat/util/device_utils.dart';
import 'package:flutter_chat/util/theme_utils.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import 'Modules/mine/provider/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // runApp(MyApp());
  normalLogin();
}

void normalLogin() {
  runApp(MaterialApp(
    theme: ThemeData(
        splashColor: Colors.transparent, highlightColor: Colors.transparent),
    home: MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
      ],
      child: const LoginMain(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, this.home, this.theme}) : super(key: key) {
    Routes.initRoutes();
  }

  final Widget? home;
  final ThemeData? theme;

  @override
  Widget build(BuildContext context) {
    final Widget app = MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: Consumer2<ThemeProvider, LoginProvider>(
        builder: (_, ThemeProvider provider, LoginProvider localeProvider, __) {
          return _buildMaterialApp(provider, localeProvider);
        },
      ),
    );

    /// Toast 配置
    return OKToast(
        backgroundColor: Colors.black54,
        textPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        radius: 20.0,
        position: ToastPosition.bottom,
        child: app);
  }

  Widget _buildMaterialApp(
      ThemeProvider provider, LoginProvider localeProvider) {
    return MaterialApp(
      title: 'Flutter Chat',
      // showPerformanceOverlay: true, //显示性能标签
      // debugShowCheckedModeBanner: false, // 去除右上角debug的标签
      // checkerboardRasterCacheImages: true,
      // showSemanticsDebugger: true, // 显示语义视图
      // checkerboardOffscreenLayers: true, // 检查离屏渲染

      theme: theme ?? provider.getTheme(),
      darkTheme: provider.getTheme(isDarkMode: true),
      themeMode: provider.getThemeMode(),
      home: home ?? const LoginMain(),
      onGenerateRoute: Routes.router.generator,
      // localizationsDelegates: DeerLocalizations.localizationsDelegates,
      // supportedLocales: DeerLocalizations.supportedLocales,
      // locale: localeProvider.locale,
      builder: (BuildContext context, Widget? child) {
        /// 仅针对安卓
        if (Device.isAndroid) {
          /// 切换深色模式会触发此方法，这里设置导航栏颜色
          ThemeUtils.setSystemNavigationBar(provider.getThemeMode());
        }

        /// 保证文字大小不受手机系统设置影响 https://www.kikt.top/posts/flutter/layout/dynamic-text/
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },

      // /// 因为使用了fluro，这里设置主要针对Web
      // onUnknownRoute: (_) {
      //   return MaterialPageRoute<void>(
      //     builder: (BuildContext context) => const NotFoundPage(),
      //   );
      // },
      restorationScopeId: 'app',
    );
  }
}
