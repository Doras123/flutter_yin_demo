import 'package:flutter/material.dart';
import 'package:flutter_yin_demo/Components/list_view_card.dart';
import 'package:flutter_yin_demo/Components/rotation_chart.dart';
import 'package:flutter_yin_demo/config/app_colors.dart';
import 'package:flutter_yin_demo/models/content_model.dart';
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
        _article(),
      ],
    );
  }

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

  Widget _guess() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(0.5)
      ),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: toRpx(context, 10)),
      padding: EdgeInsets.all(toRpx(context, 20)),
      child: Guess(),
    );
  }

  Widget _article() {
    Content content = Content();

    List<Content> list = [];
    List.generate(10, (index) => list.add(content));

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(0.5)
      ),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: toRpx(context, 10)),
      child: ListView.separated(
        shrinkWrap: true,  //Container跟随GridView内容变化高度
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