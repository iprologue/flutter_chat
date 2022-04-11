import 'dart:async';

import 'package:flutter/cupertino.dart';

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
