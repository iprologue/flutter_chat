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

class QuickLoginPage extends StatelessWidget {
  const QuickLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    return Stack(fit: StackFit.expand, children: <Widget>[
      const BackgroundSlideMain(),
      const BackgroundSlideToChange(),
      Positioned(
        left: 0,
        top: 250 * rpx,
        child: const QuickLoginBox(),
      ),
    ]);
  }
}

class BackgroundSlideMain extends StatelessWidget {
  const BackgroundSlideMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginProvider provider = Provider.of<LoginProvider>(context);
    return Opacity(
      opacity: provider.opacityMain,
      child: LoadAssetImage('chat_${provider.index}'),
    );
  }
}

class BackgroundSlideToChange extends StatelessWidget {
  const BackgroundSlideToChange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginProvider provider = Provider.of<LoginProvider>(context);
    return Opacity(
      opacity: provider.opacityToChange,
      child: LoadAssetImage('chat_${provider.indexToChange}'),
    );
  }
}
