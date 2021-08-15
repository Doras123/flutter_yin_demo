import 'package:flutter/material.dart';
import 'package:flutter_yin_demo/common/search_page.dart';
import 'package:flutter_yin_demo/config/app_colors.dart';

class RootPageHead extends StatelessWidget {
  //搜索框
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: [
            Image.asset(
              'assets/images/common/logo.png',
              height: 32,
              color: AppColors.brand_color,
            ),
            Container(
              margin: const EdgeInsets.only(left: 2),
              child: Text(
                '音悦台',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: AppColors.active,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: InkWell(
            child: _searchContent(),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => SearchPage(),
                ),
              );
              /*pushNamed(context,'/search_page');*/
            },
          ),
        ),
        Image.asset(
          'assets/images/icons/msg.png',
          height: 30,
          color: AppColors.brand_color,
        ),
      ],
    );
  }

  Widget _searchContent() {
    return Container(
      height: 30,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.page,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 6,right: 2),
            child: Icon(
              Icons.search,
              size: 17,
              color: AppColors.un3active,
            ),
          ),
          Text(
            '搜索关键词',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.un3active,
            ),
          ),
        ],
      ),
    );
  }
}