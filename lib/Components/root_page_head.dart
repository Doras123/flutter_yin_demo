import 'package:flutter/material.dart';
import 'package:flutter_yin_demo/common/search_page.dart';
import 'package:flutter_yin_demo/config/app_colors.dart';
import 'package:flutter_yin_demo/utils/util.dart';

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
              height: toRpx(context, 57),
              width: toRpx(context, 57),
              color: AppColors.brand_color,
            ),
            Container(
              margin: EdgeInsets.only(left: toRpx(context, 4)),
              child: Text(
                '音阅Bar',
                style: TextStyle(
                  fontSize: toRpx(context, 24),
                  fontWeight: FontWeight.w800,
                  color: AppColors.active,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: InkWell(
            child: _searchContent(context),
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
          height: toRpx(context, 55),
          width: toRpx(context, 55),
          color: AppColors.brand_color,
        ),
      ],
    );
  }

  Widget _searchContent(context) {
    return Container(
      height: toRpx(context, 55),
      margin: EdgeInsets.symmetric(horizontal: toRpx(context, 20)),
      decoration: BoxDecoration(
        color: AppColors.page,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: toRpx(context, 12),
                right: toRpx(context, 4)),
            child: Icon(
              Icons.search,
              size: toRpx(context, 32),
              color: AppColors.un3active,
            ),
          ),
          Text(
            '搜索关键词',
            style: TextStyle(
              fontSize: toRpx(context, 24),
              color: AppColors.un3active,
            ),
          ),
        ],
      ),
    );
  }
}