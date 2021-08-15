import 'package:flutter/material.dart';
import 'package:flutter_yin_demo/config/app_colors.dart';
import 'package:flutter_yin_demo/utils/util.dart';

class CommentLikeRead extends StatelessWidget {
  final int commentCount;
  final int thumbUpCount;
  final int readCount;

  const CommentLikeRead({
    Key? key,
    required this.commentCount,
    required this.thumbUpCount,
    required this.readCount
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _iconText(Icons.comment,commentCount),
        _iconText(Icons.thumb_up, thumbUpCount),
        _iconText(Icons.remove_red_eye_outlined, readCount)
      ],
    );
  }

  Widget _iconText(icon, int count) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: AppColors.un2active,
            size: 18
          ),
          SizedBox(width: 4),
          Expanded(
            child: Text(
              formatCharCount(count),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: AppColors.un3active,
                  fontSize: 12
              ),
            ),
          ),
        ],
      ),
    );
  }
}
