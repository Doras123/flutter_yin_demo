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
        _iconText(Icons.comment,commentCount,context),
        _iconText(Icons.thumb_up, thumbUpCount,context),
        _iconText(Icons.remove_red_eye_outlined, readCount,context)
      ],
    );
  }

  Widget _iconText(icon, int count, context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: AppColors.un2active,
            size: toRpx(context, 30),

          ),
          SizedBox(width: toRpx(context, 8)),
          Expanded(
            child: Text(
              formatCharCount(count),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: AppColors.un3active,
                  fontSize: toRpx(context, 24)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
