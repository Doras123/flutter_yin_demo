import 'package:flutter/material.dart';
import 'package:flutter_yin_demo/Components/avatar_role_name.dart';
import 'package:flutter_yin_demo/Components/comment_like_read.dart';
import 'package:flutter_yin_demo/config/app_colors.dart';
import 'package:flutter_yin_demo/models/video_model.dart';
import 'package:flutter_yin_demo/utils/util.dart';

class VideoCard extends StatelessWidget {
  final VideoItem videoItem;
  const VideoCard({Key? key, required this.videoItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: toRpx(context, 10)),
      child:Column(
        children: <Widget>[
          _videoCover(context),
          _videoInfo(context),
        ],
      ),
    );
  }

  Widget _videoCover(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: toRpx(context, 350),
      child: Stack(
        children: [
          Image.network(
            videoItem.coverPictureUrl,
            width: MediaQuery.of(context).size.width,
            height: toRpx(context, 350),
            fit: BoxFit.fill,
          ),
          Center(
            child: Image.asset(
              'assets/images/icons/play-1.png',
              width: toRpx(context, 100),
              height: toRpx(context, 100),
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          Positioned(
            left: toRpx(context, 20),
            top: toRpx(context, 10),
            child: Text(
              '【${videoItem.type}】${videoItem.videoName}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style:TextStyle(
                  color: Colors.white,
                  fontSize: toRpx(context, 29)
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _videoInfo(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: toRpx(context, 5),
          vertical: toRpx(context, 20)),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(

            width: toRpx(context, 200),
            child: AvatarRoleName(
              avatarUrl: videoItem.avatarUrl,
              userName: videoItem.userName,
            ),
          ),
          SizedBox(width: toRpx(context, 10)),
          _followButton(context),
          SizedBox(width: toRpx(context, 40)),
          Expanded(
            child: CommentLikeRead(
              thumbUpCount: videoItem.thumbUpCount,
              commentCount: videoItem.commentCount,
              readCount: videoItem.readCount,
            ),
          ),
        ],
      ),
    );
  }

  Widget _followButton(context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.add,
          color: AppColors.brand_color,
          size: toRpx(context, 22),
        ),
        Text(
          '关注',
          style: TextStyle(
            color: AppColors.brand_color,
            fontSize: toRpx(context, 22)
          ),
        )
      ],
    );
  }
}
