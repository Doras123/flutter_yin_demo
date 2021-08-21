import 'package:flutter/material.dart';
import 'package:flutter_yin_demo/Components/song_card.dart';
import 'package:flutter_yin_demo/config/app_colors.dart';
import 'package:flutter_yin_demo/models/song_model.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';



class SongPage extends StatefulWidget {
  @override
  _SongPageState createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  SongItem songItem =SongItem();
  List<SongItem> _songList = [];

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
      _songList.length = 0;
    });
    _controller.finishRefresh();
  }

  //上拉加载
  Future _onLoad() async{
    await Future.delayed(Duration(milliseconds: 1000));
    if(mounted) setState(() {});
    _controller.finishLoad();
  }

  Widget _genSongCardList() {
    List.generate(10, (index) => _songList.add(songItem));

    return EasyRefresh(
      controller: _controller,
      onLoad: _onLoad,
      onRefresh: _onRefresh,
      header: BezierCircleHeader(
        backgroundColor: AppColors.page,
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
        physics: BouncingScrollPhysics(),
        itemCount: _songList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              elevation: 1,
              child: SongCard(songItem: songItem)
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:_genSongCardList(),
    );
  }
}