import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_chat/Modules/login/provider/login_provider.dart';
import 'package:flutter_chat/widget/load_image.dart';
import 'package:provider/provider.dart';

import 'login_box.dart';

class LoginMain extends StatelessWidget {
  const LoginMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginProvider provider = Provider.of<LoginProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnimatedSwitcher(
        duration: const Duration(microseconds: 500),
        child: provider.curLoginWidget == 0
            ? const QuickLoginPage()
            : const QuickLoginPage(),
      ),
    );
  }
}

class QuickLoginPage extends StatefulWidget {
  const QuickLoginPage({Key? key}) : super(key: key);

  @override
  State<QuickLoginPage> createState() => _QuickLoginPageState();
}

class _QuickLoginPageState extends State<QuickLoginPage>
    with TickerProviderStateMixin {
  Animation<double>? backgroundAnimation;
  AnimationController? backgroundController;
  TextEditingController? userNameController = TextEditingController();
  double opacityMain = 1;
  double opacityToChange = 0;
  int index = 0;
  int indexToChange = 1;

  int curLoginWidget = 0; //0 quick 1 normal
  int imageCount = 4;
  Timer? interval;

  @override
  void initState() {
    super.initState();
    backgroundController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    backgroundAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(backgroundController!)
          ..addListener(() {
            setState(() {
              opacityMain = 1 - backgroundAnimation!.value;
              opacityToChange = backgroundAnimation!.value;
            });
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                index = index + 1;
                indexToChange = indexToChange + 1;
                if (index == imageCount) {
                  index = 0;
                }

                if (indexToChange == imageCount) {
                  indexToChange = 0;
                }
                opacityMain = 1;
                opacityToChange = 0;
              });
            }
          });
    interval = Timer.periodic(const Duration(seconds: 5), (callback) {
      backgroundController?.forward(from: 0);
    });
  }

  @override
  void dispose() {
    interval?.cancel();
    backgroundController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: <Widget>[
      BackgroundSlideMain(
        index: index,
        opacityMain: opacityMain,
      ),
      BackgroundSlideToChange(
        opacityToChange: opacityToChange,
        indexToChange: indexToChange,
      ),
      const Positioned(
        left: 0,
        top: 150,
        child: QuickLoginBox(),
      ),
    ]);
  }
}

class BackgroundSlideMain extends StatelessWidget {
  const BackgroundSlideMain(
      {Key? key, required this.opacityMain, required this.index})
      : super(key: key);
  final double opacityMain;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacityMain,
      child: LoadAssetImage(
        'chat_$index',
        fit: BoxFit.cover,
      ),
    );
  }
}

class BackgroundSlideToChange extends StatelessWidget {
  const BackgroundSlideToChange(
      {Key? key, required this.opacityToChange, required this.indexToChange})
      : super(key: key);
  final double opacityToChange;
  final int indexToChange;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacityToChange,
      child: LoadAssetImage(
        'chat_$indexToChange',
        fit: BoxFit.cover,
      ),
    );
  }
}
