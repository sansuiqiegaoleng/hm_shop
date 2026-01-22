import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Cart/index.dart';
import 'package:hm_shop/pages/Category/index.dart';
import 'package:hm_shop/pages/Home/index.dart';
import 'package:hm_shop/pages/Mine/index.dart';
import 'package:hm_shop/stores/TokenManager.dart';
import 'package:hm_shop/stores/UserController.dart';
import 'package:get/get.dart';
import 'package:hm_shop/api/user.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final UserController _userController = Get.put(UserController());

  _initUser() async {
    await tokenManager.init();
    if (tokenManager.getToken().isNotEmpty) {
      _userController.updateUserInfo(await getUserInfoAPI());
      // 有token，初始化用户信息
    }
  }

  @override
  void initState() {
    super.initState();
    // 初始化用户信息
    _initUser();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> _tablist = [
      {
        'title': '首页',
        'icon': 'lib/assets/ic_public_home_normal.png',
        'activeIcon': 'lib/assets/ic_public_home_active.png',
      },
      {
        'title': '分类',
        'icon': 'lib/assets/ic_public_pro_normal.png',
        'activeIcon': 'lib/assets/ic_public_pro_active.png',
      },
      {
        'title': '购物车',
        'icon': 'lib/assets/ic_public_cart_normal.png',
        'activeIcon': 'lib/assets/ic_public_cart_active.png',
      },
      {
        'title': '我的',
        'icon': 'lib/assets/ic_public_my_normal.png',
        'activeIcon': 'lib/assets/ic_public_my_active.png',
      },
    ];

    List<BottomNavigationBarItem> _getTabBarWidgets() {
      return List.generate(_tablist.length, (index) {
        return BottomNavigationBarItem(
          icon: Image.asset(_tablist[index]['icon']!, width: 30, height: 30),
          activeIcon: Image.asset(
            _tablist[index]['activeIcon']!,
            width: 30,
            height: 30,
          ),
          label: _tablist[index]['title'],
        );
      }).toList();
    }

    List<Widget> getPages() {
      return [HomeView(), CategoryView(), CartView(), MineView()];
    }

    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: getPages()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        selectedItemColor: const Color.fromARGB(255, 237, 168, 191),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _getTabBarWidgets(),
        currentIndex: _currentIndex,
      ),
    );
  }
}
