import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/Modules/mine/mine_router.dart';
import 'package:flutter_chat/routers/fluro_navigator.dart';
import 'package:flutter_chat/widget/my_app_bar.dart';

import '../../../util/res/colors.dart';
import '../../../util/res/dimens.dart';
import '../../../util/res/gaps.dart';
import '../../../util/theme_utils.dart';
import '../../../widget/click_item.dart';
import '../../../widget/my_button.dart';

class NormalPage extends StatefulWidget {
  const NormalPage({Key? key}) : super(key: key);

  @override
  State<NormalPage> createState() => _NormalPageState();
}

class _NormalPageState extends State<NormalPage> {
  @override
  Widget build(BuildContext context) {
    final itemList = [
      {
        'title': '深色模式',
        'onTap': () {
          NavigatorUtils.push(context, MineRouter.themePage);
        },
      },
      {},
      {'title': '多语言', 'onTap': () {}},
      {'title': null},
      {'title': '字体大小', 'onTap': () {}, 'line': true},
      {'title': '聊天背景', 'onTap': () {}, 'line': true},
      {'title': '我的表情', 'onTap': () {}, 'line': true},
      {'title': '照片、视频、文件和童话', 'onTap': () {}, 'line': true},
      {},
      {'title': '听筒模式', 'onTap': () {}},
      {},
      {'title': '发现页管理', 'onTap': () {}, 'line': true},
      {'title': '辅助功能', 'onTap': () {}},
      {},
      {'title': '聊天记录备份与迁移', 'onTap': () {}, 'line': true},
      {'title': '存储空间', 'onTap': () {}},
    ];
    return Scaffold(
      appBar: const MyAppBar(
        centerTitle: '通用',
      ),
      body: ListView(
        children: [
          for (Map item in itemList)
            if (item['title'] != null)
              ClickItem(
                title: item['title'],
                onTap: item['onTap'],
                line: item['line'] == true ? true : false,
              )
            else
              Gaps.vGap10,
          Gaps.vGap10,
          MyButton(
            onPressed: () {},
            child: Text(
              '清空聊天记录',
              style: TextStyle(
                  fontSize: Dimens.font_sp14,
                  fontWeight: FontWeight.w400,
                  color: ThemeUtils.isDark(context)
                      ? Colours.dark_text
                      : Colours.text),
            ),
            backgroundColor: ThemeUtils.isDark(context)
                ? Colours.dark_material_bg
                : Colors.white,
          ),
        ],
      ),
    );
  }
}
