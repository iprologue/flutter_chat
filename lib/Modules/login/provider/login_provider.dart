import 'dart:async';
import 'package:flutter/cupertino.dart';

class LoginProvider extends State<StatefulWidget>
    with ChangeNotifier, TickerProviderStateMixin {
  Animation<double>? backgroundAnimation;
  AnimationController? backgroundController;
  TextEditingController? userNameController = TextEditingController();
  double opacityMain = 1;
  double opacityToChange = 0;
  int index = 0;
  int indexToChange = 1;

  int curLoginWidget = 0; //0 quick 1 normal
  List<String>? imgList;
  Timer? interval;
  bool? ifValidUserName = false;
  String? userName;
  String? imei;

  bool ifStartRequest = false;

  Future ifNeedLogin() async {}

  @override
  initState() {
    super.initState();
  }

  LoginProvider() {
    // print('$widget');
    initPage();
  }

  initPage() {
    userNameController?.addListener(() {
      notifyListeners();
    });

    imgList = [
      'images/chat_0',
      'images/chat_1',
      'images/chat_2',
      'images/chat_3',
    ];
    /*
    backgroundController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    backgroundAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(backgroundController!)
          ..addListener(() {
            opacityMain = 1 - backgroundAnimation!.value;
            opacityToChange = backgroundAnimation!.value;
            notifyListeners();
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              index = index + 1;
              indexToChange = indexToChange + 1;
              if (index == imgList?.length) {
                index = 0;
              }

              if (indexToChange == imgList?.length) {
                indexToChange = 0;
              }

              opacityMain = 1;
              opacityToChange = 0;
              notifyListeners();
            }
          });
    interval = Timer.periodic(const Duration(seconds: 5), (callback) {
      backgroundController?.forward(from: 0);
    });

     */
  }

  changeLoginBox() {
    curLoginWidget = curLoginWidget == 0 ? 1 : 0;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void dispose() {
    interval?.cancel();
    backgroundController?.dispose();
    userNameController?.dispose();
    super.dispose();
  }
}
