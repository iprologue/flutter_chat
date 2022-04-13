import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/Modules/mine/mine_router.dart';
import 'package:flutter_chat/routers/fluro_navigator.dart';
import 'package:flutter_chat/util/res/colors.dart';
import 'package:flutter_chat/util/res/dimens.dart';
import 'package:flutter_chat/widget/click_item.dart';
import 'package:flutter_chat/widget/load_image.dart';

import '../../../util/image_utils.dart';
import '../../../util/res/gaps.dart';
import '../../../util/theme_utils.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    final itemList = [
      {'title': '服务', 'onTap': () {}, 'image': 'mine/bankCard'},
      {'title': null},
      {
        'title': '收藏',
        'onTap': () {},
        'line': true,
        'image': 'mine/myFavorites'
      },
      {'title': '朋友圈', 'onTap': () {}, 'line': true, 'image': 'mine/myAlbum'},
      {
        'title': '卡包',
        'onTap': () {},
        'line': true,
        'image': 'mine/cardPackage'
      },
      {'title': '表情', 'onTap': () {}, 'image': 'mine/shops'},
      {'title': null},
      {
        'title': '设置',
        'image': 'mine/setting',
        'onTap': () {
          NavigatorUtils.push(context, MineRouter.settingPage);
        },
      },
    ];
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: ThemeUtils.isDark(context)
                ? Colours.dark_material_bg
                : Colors.white,
            padding:
                const EdgeInsets.only(left: 20, right: 13, bottom: 35, top: 85),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(6)),
                  child: const LoadAssetImage(
                    'mine/header',
                    width: 60,
                  ),
                ),
                Gaps.hGap10,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        '溫酒',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Dimens.font_sp20),
                      ),
                      Gaps.vGap5,
                      Row(
                        children: const [
                          Expanded(
                            child: Text(
                              '微信号: 888888',
                              style: TextStyle(fontSize: Dimens.font_sp18),
                            ),
                          ),
                          Icon(Icons.qr_code,
                              color: Colours.text_gray, size: 20.0),
                          Gaps.hGap8,
                          Icon(
                            Icons.keyboard_arrow_right_outlined,
                            color: Colours.text_gray,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Gaps.vGap12,
          for (Map item in itemList)
            if (item["title"] != null)
              ClickItem(
                leading: _leading(item['image']),
                title: item['title'],
                onTap: item['onTap'],
                line: item['line'] == true ? true : false,
              )
            else
              Gaps.vGap10
        ],
      ),
    );
  }

  Widget _leading(String image, {ImageFormat format = ImageFormat.png}) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
      child: LoadAssetImage(
        image,
        format: format,
        width: 23,
      ),
    );
  }
}
