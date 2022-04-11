import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_chat/util/res/colors.dart';
import 'package:flutter_chat/widget/my_button.dart';
import 'package:provider/provider.dart';

import '../provider/login_provider.dart';

class LoginBox extends StatelessWidget {
  const LoginBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController pwdController = TextEditingController();
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);
    double rpx = MediaQuery.of(context).size.width / 750;
    double margin = 45 * rpx;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10 * rpx, sigmaY: 10 * rpx),
      child: Container(
        width: 750 * rpx - 2 * margin,
        margin: EdgeInsets.symmetric(horizontal: margin),
        padding: EdgeInsets.symmetric(horizontal: 20 * rpx, vertical: 20 * rpx),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 30 * rpx, vertical: 20 * rpx),
              decoration: BoxDecoration(
                  color: Colours.bg_gray,
                  borderRadius: BorderRadius.circular(20 * rpx),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20 * rpx,
                        color: Colors.black54,
                        offset: Offset(20 * rpx, 20 * rpx))
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20 * rpx,
                  ),
                  const LoginTitle(text: '账号/手机号'),
                  LoginTextField(
                    controller: loginProvider.userNameController!,
                    obsecure: false,
                    width: 750 * rpx - 2 * margin,
                    icon: Icon(
                      Icons.face,
                      size: 40 * rpx,
                    ),
                    correct: !loginProvider.ifValidUserName!,
                    hintText: "请输入您的账号/手机号",
                  ),
                  const LoginTitle(
                    text: "密码",
                  ),
                  LoginTextField(
                    controller: pwdController,
                    obsecure: true,
                    width: 750 * rpx - 2 * margin,
                    correct: true,
                    icon: Icon(
                      Icons.lock,
                      size: 40 * rpx,
                    ),
                    hintText: "请输入您的密码",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            '注册账号',
                            style: TextStyle(color: Colours.text),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: const Text('忘记密码?',
                              style: TextStyle(color: Colours.text)))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30 * rpx),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(20 * rpx)),
                                height: 90 * rpx,
                                // width: 750*rpx-2*margin,
                                padding: const EdgeInsets.all(0),
                                child: MyButton(
                                  onPressed: () {},
                                  text: "登录",
                                  fontSize: 35 * rpx,
                                  textColor: Colors.white,
                                  radius: 20 * rpx,
                                  backgroundColor: Colors.green[500],
                                )))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20 * rpx),
                    child: Center(
                        child: TextButton(
                      onPressed: () {
                        loginProvider.changeLoginBox();
                      },
                      child: Text(
                        "本机一键登录",
                        style: TextStyle(
                            fontSize: 30 * rpx,
                            color: Colours.text_gray,
                            decoration: TextDecoration.underline),
                      ),
                    )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LoginTitle extends StatelessWidget {
  const LoginTitle({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    return Text(
      text,
      style: TextStyle(fontFamily: "Pangmen", fontSize: 48 * rpx),
    );
  }
}

class LoginTextField extends StatelessWidget {
  const LoginTextField(
      {Key? key,
      required this.controller,
      required this.obsecure,
      required this.icon,
      required this.width,
      required this.hintText,
      required this.correct})
      : super(key: key);
  final TextEditingController controller;
  final bool obsecure;
  final Icon icon;
  final double width;
  final String hintText;
  final bool correct;

  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    double iconWidth = 40 * rpx;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25 * rpx),
      width: width,
      child: Row(children: [
        SizedBox(
            width: width - iconWidth - 120 * rpx,
            child: TextField(
              controller: controller,
              obscureText: obsecure,
              decoration: InputDecoration(
                  border: InputBorder.none, icon: icon, hintText: hintText),
              style: TextStyle(fontSize: 35 * rpx),
            )),
        correct
            ? Container()
            : Icon(
                Icons.close,
                size: iconWidth,
                color: Colors.redAccent,
              )
      ]),
    );
  }
}

class QuickLoginBox extends StatelessWidget {
  const QuickLoginBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginProvider provider = Provider.of<LoginProvider>(context);
    double rpx = MediaQuery.of(context).size.width / 750;
    double margin = 45 * rpx;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10 * rpx, sigmaY: 10 * rpx),
      child: Container(
        width: 750 * rpx - 2 * margin,
        margin: EdgeInsets.symmetric(horizontal: margin),
        padding: EdgeInsets.symmetric(horizontal: 20 * rpx, vertical: 20 * rpx),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 30 * rpx, vertical: 20 * rpx),
              decoration: BoxDecoration(
                color: Colours.bg_gray,
                borderRadius: BorderRadius.circular(20 * rpx),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20 * rpx,
                      color: Colours.material_bg,
                      offset: Offset(20 * rpx, 20 * rpx))
                ],
              ),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 30 * rpx),
                      child: Text("登录解锁更多玩法",
                          style: TextStyle(fontSize: 45 * rpx))),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 140 * rpx),
                      child: Text(
                        "188 **** 0612",
                        style: TextStyle(
                            fontSize: 50 * rpx, fontFamily: "Pangmen"),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 70 * rpx),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20 * rpx)),
                          height: 90 * rpx,
                          // width: 750*rpx-2*margin,
                          padding: const EdgeInsets.all(0),
                          child: MyButton(
                            textColor: Colors.white,
                            text: '本机一键登录',
                            fontSize: 35 * rpx,
                            onPressed: () {
                              provider.ifUserExistsByTelNo(context);
                            },
                            radius: 20 * rpx,
                            backgroundColor: Colors.green[500],
                            child: provider.ifStartRequest
                                ? Padding(
                                    padding: EdgeInsets.all(8 * rpx),
                                    child: const CircularProgressIndicator(
                                      valueColor:
                                          AlwaysStoppedAnimation(Colors.white),
                                    ))
                                : null,
                          ),
                        ))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20 * rpx),
                    child: Center(
                        child: TextButton(
                      onPressed: () {
                        provider.changeLoginBox();
                      },
                      child: Text(
                        "其他登录方式",
                        style: TextStyle(
                            fontSize: 30 * rpx,
                            color: Colours.text,
                            decoration: TextDecoration.underline),
                      ),
                    )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
