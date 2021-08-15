import 'package:flutter/material.dart';
import 'package:proste_indexed_stack/proste_indexed_stack.dart';
import 'package:flutter_yin_demo/config/app_colors.dart';
import 'package:flutter_yin_demo/view/root_pages/home_page.dart';
import 'package:flutter_yin_demo/view/root_pages/music_page.dart';
import 'package:flutter_yin_demo/view/root_pages/profile_page.dart';
import 'package:flutter_yin_demo/view/root_pages/tiny_video_page.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  //底部导航栏数组
  final items = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home),label: '首页',tooltip: ''
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.music_note),label: '音乐',tooltip: ''
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.add_box_outlined),label: '',tooltip: ''
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.slow_motion_video),label: '短视频',tooltip: ''
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_circle_outlined),label: '我的',tooltip: ''
    ),
  ];

  //底部导航栏页面
  final bodyList = [
    IndexedStackChild(child: HomePage()),
    IndexedStackChild(child: MusicPage()),
    IndexedStackChild(child: Container()),
    IndexedStackChild(child: TinyVideoPage()),
    IndexedStackChild(child: ProfilePage()),
  ];

  //当前选中页面索引
  int _currentIndex = 0;

  //底部导航栏切换
  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  //点击发布
  void _onCreateMedia() {
    print('_onCreateMedia');
  }

  //发布按钮
  Widget _createMediaButton() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: 44,
      height: 44,
      child: FloatingActionButton(
        child: Icon(Icons.add_box_outlined),
        onPressed: _onCreateMedia,
        backgroundColor: AppColors.active,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: _currentIndex,  //当前选中标识符
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
      ),
      //ProsteIndexedStack包裹，实现底部导航切换时保持原页面状态
      body: ProsteIndexedStack(
        index: _currentIndex,
        children: bodyList,
      ),
      floatingActionButton: _createMediaButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
