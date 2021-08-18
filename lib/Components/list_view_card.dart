import 'package:flutter/material.dart';
import 'package:flutter_yin_demo/config/app_colors.dart';
import 'package:flutter_yin_demo/models/content_model.dart';
import 'package:flutter_yin_demo/utils/util.dart';

class ListViewCard extends StatelessWidget {
  final Content content ;
  const ListViewCard({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(toRpx(context, 20)),
      child: _listContent(context)
    );
  }

  Widget _listContent(context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
      title: Text(
        content.title,  //标题
        style: TextStyle(
          fontSize: toRpx(context, 36),
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: toRpx(context, 35),
                height: toRpx(context, 35),
                child:  CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  backgroundImage: NetworkImage(content.avatrUrl),  //头像
                ),
              ),
              SizedBox(width: toRpx(context, 13)),
              Text(
                content.userName,  //用户名
                style: TextStyle(
                  color: AppColors.unactive,
                  fontSize: toRpx(context, 26),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: toRpx(context, 13)),
              Text(
                content.userDesc,  //用户描述
                style: TextStyle(
                  color:AppColors.un3active,
                  fontSize: toRpx(context, 26),
                ),
              ),
            ],
          ),
          Text(
            content.subTitle,  //副标题
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColors.unactive,
              fontSize: toRpx(context, 30),
              height: 1.5,  //行间距
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: toRpx(context, 15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '${content.thumbUpCount} 赞同 · ${content.commentCount} 评论',  //点赞和评论数
                  style: TextStyle(
                    fontSize: toRpx(context, 26),
                    color: AppColors.un3active,
                  ),
                ),
                Icon(
                  Icons.more_horiz,
                  color: AppColors.un3active,
                  size: toRpx(context, 35),
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}

