import 'package:flutter/material.dart';
import 'package:flutter_yin_demo/Components/cover.dart';
import 'package:flutter_yin_demo/config/app_colors.dart';
import 'package:flutter_yin_demo/models/song_model.dart';

class Guess extends StatefulWidget {
  const Guess({Key? key}) : super(key: key);

  @override
  _GuessState createState() => _GuessState();
}

class _GuessState extends State<Guess> {
  SongItem songItem = SongItem();

  int get count => 123456;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _guessHead(),
        SizedBox(height: 10),
        _guessContent(),
        SizedBox(height: 20),
        _changIcon()
      ],
    );
  }

  Widget _guessHead() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          '猜你喜欢',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: AppColors.active,
          ),
        ),
        InkWell(
          child: _moreIcon(),
        )
      ],
    );
  }

  Widget _moreIcon() {
    return Row(
      children: <Widget>[
        Text(
          '更多',
          style: TextStyle(
            color: AppColors.un3active,
            fontSize: 13,
          ),
        ),
        Icon(Icons.navigate_next,color: AppColors.un3active,size: 17)
      ],
    );
  }

  Widget _guessContent() {
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,  //每行3个
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.75,   //宽高比
          ),
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Cover(count: songItem.readCount),
                SizedBox(height: 5),
                _describe()
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _describe() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: AppColors.brand_color,
                borderRadius: BorderRadius.circular(4)
              ),
              child: Text(
                songItem.type,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10
                ),
              ),
            ),
            SizedBox(width: 3),
            Text(
              songItem.songName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                color: AppColors.active,
              ),
            )
          ],
        ),
        Text(
          songItem.user.userName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 13,
            color: AppColors.active,
          ),
        )
      ],
    );
  }
  
  Widget _changIcon() {
    return InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/icons/change.png',
              color: AppColors.brand_color,
              scale: 12,
            ),
            SizedBox(width: 5,),
            Text(
              '换一批',
              style: TextStyle(
                fontSize: 13,
                color: AppColors.unactive,
              ),
            )
          ],
        ),
      );
  }
}
