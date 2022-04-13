import 'package:flutter/material.dart';
import 'package:flutter_chat/util/res/dimens.dart';
import 'package:flutter_chat/widget/click_item.dart';
import 'package:flutter_chat/widget/my_app_bar.dart';

import '../../../util/image_utils.dart';
import '../../../util/res/gaps.dart';
import '../../../widget/load_image.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        centerTitle: '通讯录',
        isBack: false,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return _buildHeader(context);
          } else if (index % 10 == 1) {
            return const Padding(
              padding: EdgeInsets.only(left: 15, top: 3, bottom: 3),
              child: Text(
                'A',
                style: TextStyle(fontSize: Dimens.font_sp10),
              ),
            );
          }
          return ClickItem(
            leading: _leading('icons/${index % 23}', format: ImageFormat.jpg),
            title: 'AAA',
            line: true,
          );
        },
      ),
    );
  }

  Widget _buildHeader(context) {
    return Column(
      children: [
        Gaps.vGap8,
        ClickItem(
          leading: _leading('/contact/friend'),
          title: '新的朋友',
          line: true,
        ),
        ClickItem(
          leading: _leading('/contact/group'),
          title: '群聊',
          line: true,
        ),
        ClickItem(
          leading: _leading('/contact/tag'),
          title: '标签',
          line: true,
        ),
        ClickItem(
          leading: _leading('/contact/offical'),
          title: '公众号',
        ),
      ],
    );
  }

  Widget _leading(String image, {ImageFormat format = ImageFormat.png}) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
      child: LoadAssetImage(
        image,
        format: format,
        width: 30,
      ),
    );
  }
}
