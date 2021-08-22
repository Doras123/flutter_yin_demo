import 'package:flutter/material.dart';
import 'package:flutter_yin_demo/Components/song_cover.dart';
import 'package:flutter_yin_demo/config/app_colors.dart';
import 'package:flutter_yin_demo/models/song_model.dart';
import 'package:flutter_yin_demo/utils/util.dart';

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
        SizedBox(height: toRpx(context, 12)),
        _guessContent(),
        SizedBox(height:  toRpx(context, 12)),
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
            fontSize: toRpx(context, 28),
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
            fontSize: toRpx(context, 22),
          ),
        ),
        Icon(
          Icons.navigate_next,
            color: AppColors.un3active,
            size: toRpx(context, 28)
        )
      ],
    );
  }

  Widget _guessContent() {
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,  //Container跟随GridView内容变化高度
          physics: NeverScrollableScrollPhysics(),
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,  //每行3个
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.7,   //宽高比
          ),
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Cover(count: songItem.readCount),
                SizedBox(height: toRpx(context, 12)),
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
              padding: EdgeInsets.symmetric(vertical: toRpx(context, 2),
                  horizontal: toRpx(context, 6)),
              decoration: BoxDecoration(
                color: AppColors.brand_color,
                borderRadius: BorderRadius.circular(4)
              ),
              child: Text(
                songItem.type,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: toRpx(context, 16),
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            SizedBox(width: toRpx(context, 6)),
            Text(
              songItem.songName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: toRpx(context, 23),
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
            fontSize: toRpx(context, 23),
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
              scale: toRpx(context, 24),
            ),
            SizedBox(width: toRpx(context, 15),),
            Text(
              '换一批',
              style: TextStyle(
                fontSize: toRpx(context, 22),
                color: AppColors.unactive,
              ),
            )
          ],
        ),
      );
  }
}
