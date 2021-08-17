import 'package:flutter/material.dart';
import 'package:flutter_yin_demo/Components/rotation_chart.dart';
import 'package:flutter_yin_demo/config/app_colors.dart';
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
    return Column(
      children:<Widget>[
        _banner(),
        _guess(),
      ],
    );
  }

  Widget _banner() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      margin: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: RotationChart(),
      ),
    );
  }

  Widget _guess() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 450,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Guess(),
    );
  }
}