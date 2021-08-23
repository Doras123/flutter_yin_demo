import 'package:flutter/material.dart';
import 'package:flutter_yin_demo/Components/list_view_card.dart';
import 'package:flutter_yin_demo/Components/rotation_chart.dart';
import 'package:flutter_yin_demo/Components/video_card.dart';
import 'package:flutter_yin_demo/models/content_model.dart';
import 'package:flutter_yin_demo/models/video_model.dart';
import 'package:flutter_yin_demo/utils/util.dart';
import 'package:flutter_yin_demo/view/sub_pages/home_pages/recommend_page/guess.dart';

final List<String> images = [
  'https://img2.doubanio.com/view/music_topic_cover/large/public/topic-zhoubichanginterview-1.jpg',
  'https://img2.doubanio.com/view/music_topic_cover/large/public/topic-nochoicewetware-1.jpg',
  'https://img2.doubanio.com/view/music_topic_cover/large/public/topic-coldcavetour-2.jpg',
  'https://img2.doubanio.com/view/music_topic_cover/large/public/topic-danielmiller-1.jpg',
  'https://img2.doubanio.com/view/music_topic_cover/large/public/topic-murkycrowspainting-1.jpg',
];

class RecommendPage extends StatefulWidget {
  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children:<Widget>[
        _banner(),
        _guess(),
        _video(),
        _article(),
      ],
    );
  }

  //Banner
  Widget _banner() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: toRpx(context, 250),
      margin: EdgeInsets.symmetric(vertical: toRpx(context, 20)),
      padding: EdgeInsets.symmetric(horizontal: toRpx(context, 20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: RotationChart(),
      ),
    );
  }

  //猜你喜欢
  Widget _guess() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(0.5),
      ),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: toRpx(context, 10)),
      padding: EdgeInsets.all(toRpx(context, 20)),
      child: Guess(),
    );
  }

  //视频推荐
  Widget _video() {
    VideoItem videoItem = VideoItem();

    List<VideoItem> list = [];
    List.generate(2, (index) => list.add(videoItem));

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(0.5),
      ),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: toRpx(context, 10)),
      padding: EdgeInsets.all(toRpx(context, 20)),
      child: ListView.builder(
        shrinkWrap: true,  //Container跟随ListView内容变化高度
        physics: NeverScrollableScrollPhysics(),  //禁止滚动效果
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              margin: EdgeInsets.only(bottom: toRpx(context, 10)),
              child: VideoCard(videoItem: videoItem),
            )
          );
        },
      ),
    );
  }

  //文章推荐
  Widget _article() {
    Content content = Content();

    List<Content> list = [];
    List.generate(5, (index) => list.add(content));

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(0.5)
      ),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: toRpx(context, 10)),
      child: ListView.separated(
        shrinkWrap: true,  //Container跟随ListView内容变化高度
        physics: NeverScrollableScrollPhysics(),  //禁止滚动效果
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return ListViewCard(content: content);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(color: Colors.grey.withOpacity(0.2));
        },
      ),
    );
  }
}