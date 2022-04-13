import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_chat/routers/fluro_navigator.dart';
import 'package:flutter_chat/routers/routers.dart';
import 'package:flutter_chat/util/db/pro_cache.dart';
import 'package:flutter_chat/util/res/constant.dart';

class LoginProvider extends State<StatefulWidget> with ChangeNotifier {
  TextEditingController? userNameController = TextEditingController();

  int curLoginWidget = 0; //0 quick 1 normal

  bool? ifValidUserName = false;
  String? userName;
  String? imei;

  bool ifStartRequest = false;

  Future ifNeedLogin() async {}

  @override
  initState() {
    super.initState();
    initPage();
  }

  LoginProvider() {
    initPage();
  }

  initPage() {
    userNameController?.addListener(() {
      notifyListeners();
    });
  }

  changeLoginBox() {
    curLoginWidget = curLoginWidget == 0 ? 1 : 0;
    notifyListeners();
  }

  ifUserExistsByTelNo(BuildContext context) async {
    ifStartRequest = true;
    notifyListeners();

    ProCache.getInstance().setString(Constant.accessToken, '1111');
    NavigatorUtils.push(context, Routes.home, clearStack: true);
    ifStartRequest = false;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void dispose() {
    userNameController?.dispose();
    super.dispose();
  }
}
