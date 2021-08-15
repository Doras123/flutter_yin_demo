import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yin_demo/config/app_colors.dart';

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
        titleSpacing: 5,
        automaticallyImplyLeading: false,  //隐藏leading
        title: _searchContent(),
        actions: <Widget>[
          CupertinoButton(
            padding: EdgeInsets.only(right: 10),
            child: Text(
              '取消',
              style: TextStyle(
                color: AppColors.active,
                fontSize: 14
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
      height: 25,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.page,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              Icons.search,
              size: 15,
              color: AppColors.un3active,
            ),
          ),
            Expanded(
              child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '搜索关键词',
                    hintStyle: TextStyle(
                      fontSize: 12,
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