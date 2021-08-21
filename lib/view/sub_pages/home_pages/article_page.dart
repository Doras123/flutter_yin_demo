import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_yin_demo/Components/list_view_card.dart';
import 'package:flutter_yin_demo/config/app_colors.dart';
import 'package:flutter_yin_demo/models/content_model.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  Content content =Content();
  List<Content> list = [];

  late EasyRefreshController _controller;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

  //下拉刷新
  Future _onRefresh() async{
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {
      list.length = 0;
    });
    _controller.finishRefresh();
  }

  //上拉加载
  Future _onLoad() async{
    await Future.delayed(Duration(milliseconds: 1000));
    if(mounted) setState(() {});
    _controller.finishLoad();
  }

  Widget genContentList() {
    List.generate(5, (index) => list.add(content));

    return EasyRefresh(
      controller: _controller,
      onRefresh: _onRefresh,
      onLoad: _onLoad,
      header: BezierCircleHeader(
        backgroundColor: AppColors.page
      ),
      footer: ClassicalFooter(
        loadingText: '···正在加载，请稍等···',
        loadedText: '··加载完毕··',
        loadFailedText: '···加载失败，请检查网络连接是否正常···',
        noMoreText: '···我是有底线的···',
        textColor: AppColors.unactive,
        showInfo: false
      ),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 1,
            child: ListViewCard(content: content),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: genContentList()
    );
  }
}