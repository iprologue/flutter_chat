import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_chat/util/res/colors.dart';
import 'package:provider/provider.dart';

import '../provider/login_provider.dart';

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
                        "151 **** 0612",
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
                          child: ElevatedButton(
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(20 * rpx)),
                            // color: Colors.green[500],
                            child: provider.ifStartRequest
                                ? Padding(
                                    padding: EdgeInsets.all(8 * rpx),
                                    child: const CircularProgressIndicator(
                                      valueColor:
                                          AlwaysStoppedAnimation(Colors.white),
                                    ))
                                : Text(
                                    "本机一键登录",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 35 * rpx),
                                  ),
                            onPressed: () {
                              // provider.ifUserExistsByTelNo(context);
                            },
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
                        // provider.changeLoginBox();
                      },
                      child: Text(
                        "其他登录方式",
                        style: TextStyle(
                            fontSize: 30 * rpx,
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
