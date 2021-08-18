import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yin_demo/config/app_colors.dart';
import 'package:flutter_yin_demo/utils/util.dart';

class SearchPage extends StatefulWidget {
  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  var _keywords;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: toRpx(context, 10), //标题与leading的间距
        automaticallyImplyLeading: false,  //隐藏leading
        title: _searchContent(),
        actions: <Widget>[
          CupertinoButton(
            padding: EdgeInsets.only(right: toRpx(context, 20)),
            child: Text(
              '取消',
              style: TextStyle(
                color: AppColors.active,
                fontSize: toRpx(context, 26)
              ),
            ),
            onPressed:() {
              Navigator.of(context).pop();  //返回上一页
            },
          )
        ],
      ),
    );
  }

  Widget _searchContent() {
    return Container(
      height: toRpx(context, 45),
      margin: EdgeInsets.symmetric(horizontal: toRpx(context, 20)),
      decoration: BoxDecoration(
        color: AppColors.page,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: toRpx(context, 14)),
            child: Icon(
              Icons.search,
              size: toRpx(context, 28),
              color: AppColors.un3active,
            ),
          ),
            Expanded(
              child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '搜索关键词',
                    hintStyle: TextStyle(
                      fontSize: toRpx(context, 22),
                      color: AppColors.un3active,
                    ),
                  ),
              ),
            )
        ],
      ),
    );
  }
}