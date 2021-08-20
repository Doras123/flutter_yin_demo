import 'package:flutter/material.dart';
import 'package:flutter_yin_demo/Components/root_page_head.dart';
import 'package:flutter_yin_demo/config/app_colors.dart';
import 'package:flutter_yin_demo/utils/util.dart';
import 'package:flutter_yin_demo/view/sub_pages/home_pages/article_page.dart';
import 'package:flutter_yin_demo/view/sub_pages/home_pages/recommend_page/recommend_page.dart';
import 'package:flutter_yin_demo/view/sub_pages/home_pages/song_page.dart';

class _TabData {
  final Widget tab;
  final Widget body;
  _TabData({required this.tab,required this.body});
}

final _tabDataList = <_TabData> [
  _TabData(tab: Text('关注'), body: Text('1')),
  _TabData(tab: Text('推荐'), body: RecommendPage()),
  _TabData(tab: Text('VIP'), body: Text('1')),
  _TabData(tab: Text('热榜'), body: Text('1')),
  _TabData(tab: Text('歌曲'), body: SongPage()),
  _TabData(tab: Text('文章'), body: ArticlePage()),
  _TabData(tab: Text('视频'), body: Text('1')),
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final tabBarList = _tabDataList.map((item) => item.tab).toList();
  final tabBarViewList = _tabDataList.map((item) => item.body).toList();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabBarViewList.length,  //顶部tab数量
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: RootPageHead(),
          //顶部导航栏设置
          bottom: TabBar(
            indicatorColor: AppColors.brand_color,
            indicatorWeight: toRpx(context, 4),
            indicatorPadding: EdgeInsets.symmetric(horizontal: toRpx(context, 15),
                vertical: toRpx(context, 10)),
            labelPadding: EdgeInsets.symmetric(horizontal: toRpx(context, 30),
                vertical: toRpx(context, 10)),
            unselectedLabelStyle: TextStyle(fontSize: toRpx(context, 32)),
            labelStyle:TextStyle(fontSize: toRpx(context, 36)),
            isScrollable: true,
            tabs: tabBarList,
          ),
        ),
        body: TabBarView(
          children: tabBarViewList,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }
}