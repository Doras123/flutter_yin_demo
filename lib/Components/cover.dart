import 'package:flutter/material.dart';
import 'package:flutter_yin_demo/models/song_model.dart';
import 'package:flutter_yin_demo/utils/util.dart';

class Cover extends StatelessWidget {
  final count;
  const Cover({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SongItem songItem =SongItem();
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          FadeInImage.assetNetwork(
            placeholder: 'assets/images/common/lazy-2.png',
            image: songItem.coverPictureUrl,
            fit: BoxFit.cover, //撑满父级
          ),
          //增加蒙层让图片底部的文字可以更清晰度
          Container(
            height: 30,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors:[
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.1),
                    Colors.transparent,
                  ],
                  stops: [0.3,0.6,0.8,1],
                )
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.play_arrow,
                  size: 10,
                  color: Colors.white,
                ),
                SizedBox(width: 5),
                Text(
                  formatCharCount(count),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 10,
                      color: Colors.white
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}

