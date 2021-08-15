import 'package:flutter/material.dart';
import 'package:flutter_yin_demo/config/app_colors.dart';
import 'package:flutter_yin_demo/models/content_model.dart';

class ListViewCard extends StatelessWidget {
  final Content content ;
  const ListViewCard({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      child: _listContent()
    );
  }

  Widget _listContent() {
    return ListTile(
        title: Text(
          content.title,  //标题
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 25,
                  height: 25,
                  child:  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    backgroundImage: NetworkImage(content.avatrUrl),  //头像
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  content.userName,  //用户名
                  style: TextStyle(
                    color: AppColors.unactive,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  content.userDesc,  //用户描述
                  style: TextStyle(
                      color:AppColors.un3active
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
                height: 1.5,  //行间距
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '${content.thumbUpCount} 赞同 · ${content.commentCount} 评论',  //点赞和评论数
                    style: TextStyle(
                      color: AppColors.un3active,
                    ),
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: AppColors.un3active,)
                ],
              ),
            ),
          ],
        )
    );
  }
}

