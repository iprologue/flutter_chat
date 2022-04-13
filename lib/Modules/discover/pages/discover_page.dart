import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/widget/click_item.dart';
import 'package:flutter_chat/widget/load_image.dart';
import 'package:flutter_chat/widget/my_app_bar.dart';

import '../../../util/image_utils.dart';
import '../../../util/res/resources.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(
          centerTitle: '发现',
          isBack: false,
        ),
        body: ListView(
          children: [
            ClickItem(
              leading: _leading('/discover/showAlbum'),
              title: '朋友圈',
              onTap: () {},
            ),
            Gaps.vGap10,
            ClickItem(
              leading: _leading('/discover/qRCode'),
              title: '扫一扫',
              onTap: () {},
            ),
            ClickItem(
              leading: _leading('/discover/shake'),
              title: '摇一摇',
              onTap: () {},
            ),
            Gaps.vGap10,
            ClickItem(
              leading: _leading('/discover/shoppingBag'),
              title: '购物',
              onTap: () {},
            ),
            ClickItem(
              title: '游戏',
              onTap: () {},
              leading: _leading('/discover/game'),
            )
          ],
        ));
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
