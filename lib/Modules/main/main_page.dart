import 'package:flutter/material.dart';
import 'package:flutter_chat/Modules/chat/pages/chat_page.dart';
import 'package:flutter_chat/Modules/contacts/pages/contacts_page.dart';
import 'package:flutter_chat/Modules/discover/pages/discover_page.dart';
import 'package:flutter_chat/Modules/main/provider/main_provider.dart';
import 'package:flutter_chat/Modules/mine/pages/mine_page.dart';
import 'package:flutter_chat/util/theme_utils.dart';
import 'package:flutter_chat/widget/load_image.dart';
import 'package:provider/provider.dart';

import '../../util/res/colors.dart';
import '../../util/res/dimens.dart';
import '../../widget/double_tap_back_exit_app.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with RestorationMixin {
  static const double _imageSize = 25.0;

  late List<Widget> _pageList;
  final List<String> _appBarTitles = ['聊天', '通讯录', '发现', '我'];
  final PageController _pageController = PageController();

  MainProvider provider = MainProvider();

  List<BottomNavigationBarItem>? _list;

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void initData() {
    _pageList = [
      const ChatPage(),
      const ContactsPage(),
      const DiscoverPage(),
      const MinePage()
    ];
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItem() {
    if (_list == null) {
      const tabImages = [
        [
          LoadAssetImage(
            'tab/tabBar_0',
            width: _imageSize,
          ),
          LoadAssetImage(
            'tab/tabBar_0_',
            width: _imageSize,
          )
        ],
        [
          LoadAssetImage(
            'tab/tabBar_1',
            width: _imageSize,
          ),
          LoadAssetImage(
            'tab/tabBar_1_',
            width: _imageSize,
          )
        ],
        [
          LoadAssetImage(
            'tab/tabBar_2',
            width: _imageSize,
          ),
          LoadAssetImage(
            'tab/tabBar_2_',
            width: _imageSize,
          )
        ],
        [
          LoadAssetImage(
            'tab/tabBar_3',
            width: _imageSize,
          ),
          LoadAssetImage(
            'tab/tabBar_3_',
            width: _imageSize,
          )
        ],
      ];
      _list = List.generate(tabImages.length, (i) {
        return BottomNavigationBarItem(
          icon: tabImages[i][0],
          activeIcon: tabImages[i][1],
          label: _appBarTitles[i],
        );
      });
    }
    return _list!;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainProvider>(
        create: (_) => provider,
        child: DoubleTapBackExitApp(
            child: Scaffold(
          bottomNavigationBar: Consumer<MainProvider>(
            builder: (_, provider, __) {
              return BottomNavigationBar(
                items: _buildBottomNavigationBarItem(),
                backgroundColor: context.backgroundColor,
                type: BottomNavigationBarType.fixed,
                currentIndex: provider.value,
                elevation: 5.0,
                iconSize: 21.0,
                selectedFontSize: Dimens.font_sp10,
                unselectedFontSize: Dimens.font_sp10,
                selectedItemColor: Theme.of(context).primaryColor,
                unselectedItemColor: Colours.unselected_item_color,
                onTap: (index) => _pageController.jumpToPage(index),
              );
            },
          ),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (int index) => provider.value = index,
            children: _pageList,
          ),
        )));
  }

  @override
  String? get restorationId => 'index';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(provider, 'BottomNavigationBarCurrentIndex');
  }
}
