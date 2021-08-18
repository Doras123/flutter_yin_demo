import 'package:flutter/material.dart';
import 'package:flutter_yin_demo/Components/avatar_role_name.dart';
import 'package:flutter_yin_demo/Components/comment_like_read.dart';
import 'package:flutter_yin_demo/config/app_colors.dart';
import 'package:flutter_yin_demo/models/song_model.dart';
import 'package:flutter_yin_demo/utils/util.dart';

class SongCard extends StatelessWidget {
  final SongItem songItem ;
  const SongCard({Key? key, required this.songItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: toRpx(context, 20),
            vertical: toRpx(context, 40)),
        child: Row(
          children: <Widget>[
            _songCover(context),
            SizedBox(width: toRpx(context, 13)),
            _songContent(context)
          ]
        )
    );
  }

  //封面
  Widget _songCover(context) {
    return SizedBox(
      width: toRpx(context, 140),
      height: toRpx(context, 140),
      child: Stack(
        fit: StackFit.expand, //拉伸
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/common/lazy-1.png',
              image: songItem.coverPictureUrl,
              fit: BoxFit.cover, //撑满父级
            ),
          ),
          Center(
            child: Image.asset(
              'assets/images/icons/play-1.png',
              width: toRpx(context, 50),
              height: toRpx(context, 50),
              color: Colors.white.withOpacity(0.8),
            ),
          )
        ],
      ),
    );
  }

  Widget _songContent(context) {
    return Expanded(
      child: SizedBox(
        height: toRpx(context, 140),
        child: Stack(
          children: [
            Text(
              songItem.songName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.active,
                fontSize: toRpx(context, 30),
                fontWeight: FontWeight.w600
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: toRpx(context, 180),
                    child: AvatarRoleName(
                      avatarUrl: songItem.user.avatarUrl,
                      userName: songItem.user.userName,
                      showType: false,//不显示roleType
                    ),
                  ),
                  Expanded(
                    child: CommentLikeRead(
                      commentCount: songItem.commentCount,
                      thumbUpCount: songItem.thumbUpCount,
                      readCount: songItem.readCount,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}