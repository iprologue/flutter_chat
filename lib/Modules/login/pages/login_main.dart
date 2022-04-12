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
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: QuickLoginPage(),
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
    LoginProvider provider = Provider.of<LoginProvider>(context);
    double rpx = MediaQuery.of(context).size.width / 750;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: Stack(fit: StackFit.expand, children: <Widget>[
        BackgroundSlideMain(
          index: index,
          opacityMain: opacityMain,
        ),
        BackgroundSlideToChange(
          opacityToChange: opacityToChange,
          indexToChange: indexToChange,
        ),
        Positioned(
          left: 0,
          top: 250 * rpx,
          child: provider.curLoginWidget == 0 ? QuickLoginBox() : LoginBox(),
        ),
        if (provider.curLoginWidget == 1)
          Positioned(
            bottom: 230 * rpx,
            left: 0,
            child: Container(
              width: 750 * rpx,
              padding: EdgeInsets.symmetric(horizontal: 40 * rpx),
              child: const Divider(color: Colors.blueGrey),
            ),
          ),
        Positioned(
          bottom: 100 * rpx,
          left: 0,
          child: SizedBox(
            width: 750 * rpx,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  Icons.face,
                  size: 100 * rpx,
                  color: Colors.white70,
                ),
                Icon(
                  Icons.face,
                  size: 100 * rpx,
                  color: Colors.white70,
                ),
                Icon(
                  Icons.face,
                  size: 100 * rpx,
                  color: Colors.white70,
                ),
              ],
            ),
          ),
        )
      ]),
    );
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
