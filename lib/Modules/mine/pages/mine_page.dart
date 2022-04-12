import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/util/res/colors.dart';
import 'package:flutter_chat/util/res/dimens.dart';
import 'package:flutter_chat/widget/load_image.dart';

import '../../../util/res/gaps.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding:
                const EdgeInsets.only(left: 20, right: 13, bottom: 20, top: 80),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LoadAssetImage(
                  'mine/header',
                  width: 60,
                ),
                Gaps.hGap16,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      '溫酒',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Dimens.font_sp20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '微信号: 888888',
                          style: TextStyle(fontSize: Dimens.font_sp18),
                        ),
                        const Icon(Icons.qr_code,
                            color: Colours.text_gray, size: 20.0),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.keyboard_arrow_right_outlined,
                              color: Colours.text_gray,
                            ))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
