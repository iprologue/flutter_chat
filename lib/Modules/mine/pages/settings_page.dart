import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/Modules/mine/mine_router.dart';
import 'package:flutter_chat/routers/fluro_navigator.dart';
import 'package:flutter_chat/util/res/dimens.dart';
import 'package:flutter_chat/widget/click_item.dart';
import 'package:flutter_chat/widget/my_app_bar.dart';
import 'package:flutter_chat/widget/my_button.dart';

import '../../../util/res/colors.dart';
import '../../../util/res/gaps.dart';
import '../../../util/theme_utils.dart';
import '../../login/login_router.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final secondList = [
    {'title': '朋友权限', 'onTap': () {}, 'line': true},
    {'title': '个人消息与权限', 'onTap': () {}, 'line': true},
    {'title': '个人消息手机清单', 'onTap': () {}, 'line': true},
    {
      'title': '第三方信息共享清单',
      'onTap': () {},
    },
    {},
    {'title': '帮助与反馈', 'onTap': () {}, 'line': true},
    {
      'title': '关于微信',
      'onTap': () {},
    },
    {},
    {
      'title': '插件',
      'onTap': () {},
    },
  ];

  @override
  Widget build(BuildContext context) {
    final itemList = [
      {
        'title': '账号与安全',
        'onTap': () {},
      },
      {'title': null},
      {'title': '青少年模式', 'onTap': () {}, 'line': true},
      {
        'title': '关怀模式',
        'onTap': () {},
      },
      {},
      {'title': '消息通知', 'onTap': () {}, 'line': true},
      {
        'title': '通用',
        'onTap': () {
          NavigatorUtils.push(context, MineRouter.normalPage);
        },
      },
      {},
    ];

    return Scaffold(
      appBar: const MyAppBar(
        centerTitle: '设置',
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
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              '隐私',
              style: TextStyle(
                  fontSize: Dimens.font_sp12, color: Colours.text_gray),
            ),
          ),
          for (Map item in secondList)
            if (item['title'] != null)
              ClickItem(
                title: item['title'],
                onTap: item['onTap'],
                line: item['line'] == true ? true : false,
              )
            else
              Gaps.vGap10,
          Gaps.vGap8,
          MyButton(
            onPressed: () {},
            child: Text(
              '切换账号',
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
          Gaps.vGap10,
          MyButton(
            onPressed: () {
              NavigatorUtils.push(context, LoginRouter.loginPage,
                  clearStack: true);
            },
            child: Text(
              '退出登录',
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
