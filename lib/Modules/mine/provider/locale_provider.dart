import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../util/db/pro_cache.dart';
import '../../../util/res/constant.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? get locale {
    final String locale = ProCache.getInstance().get(Constant.locale) ?? '';
    switch (locale) {
      case 'zh':
        return const Locale('zh', 'CN');
      case 'en':
        return const Locale('en', 'US');
      default:
        return null;
    }
  }

  void setLocale(String locale) {
    ProCache.getInstance().setString(Constant.locale, locale);
    notifyListeners();
  }
}
