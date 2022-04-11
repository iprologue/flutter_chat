import 'package:flutter/material.dart';
import 'package:flutter_chat/Modules/chat/pages/chat_page.dart';
import 'package:flutter_chat/Modules/discover/pages/discover_page.dart';
import 'package:flutter_chat/Modules/main/provider/main_provider.dart';
import 'package:flutter_chat/Modules/mine/pages/mine_page.dart';
import 'package:flutter_chat/util/theme_utils.dart';
import 'package:provider/provider.dart';

import '../../util/res/colors.dart';
import '../../util/res/dimens.dart';
import '../../widget/double_tap_back_exit_app.dart';
import '../../widget/load_image.dart';
import '../friends/pages/friends_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with RestorationMixin {
  static const double _imageSize = 25.0;

  late List<Widget> _pageList;
  final List<String> _appBarTitles = ['首页', '分类', '品味', '购物车', '我的'];
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
      const FriendsPage(),
      const DiscoverPage(),
      const MinePage()
    ];
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItem() {
    if (_list == null) {
      const tabImages = [
        [
          LoadAssetImage(
            'tab/main_img_2',
            width: _imageSize,
          ),
          LoadAssetImage(
            'tab/main_img_1',
            width: _imageSize,
          ),
        ],
        [
          LoadAssetImage(
            'tab/category_img_2',
            width: _imageSize,
          ),
          LoadAssetImage(
            'tab/category_img_1',
            width: _imageSize,
          )
        ],
        [
          LoadAssetImage(
            'tab/discover_img_2',
            width: _imageSize,
          ),
          LoadAssetImage(
            'tab/discover_img_1',
            width: _imageSize,
          )
        ],
        [
          LoadAssetImage('tab/cart_img_2', width: _imageSize),
          LoadAssetImage(
            'tab/cart_img_1',
            width: _imageSize,
          )
        ],
        [
          LoadAssetImage('tab/profile_img_2', width: _imageSize),
          LoadAssetImage(
            'tab/profile_img_1',
            width: _imageSize,
          )
        ]
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
