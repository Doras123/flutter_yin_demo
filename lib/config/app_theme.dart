import 'package:flutter/material.dart';
import 'package:flutter_yin_demo/config/app_colors.dart';

final ThemeData themeData = ThemeData(
    primaryColor: AppColors.page,  //主题色
    scaffoldBackgroundColor: AppColors.page,  //脚手架下的页面背景色
    indicatorColor: AppColors.active,  //选项卡栏中所选选项卡指示器的颜色
    splashColor: Colors.transparent,  //取消按钮点击水波纹效果
    highlightColor: Colors.transparent,  //取消按钮点击水波纹效果

    textTheme: TextTheme(
        bodyText2: TextStyle(
          color: AppColors.unactive,   //普通展示文字默认颜色
        )
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.nav,
      elevation: 0,
    ),

    //顶部AppBar主题设置
    tabBarTheme: TabBarTheme(
        indicatorSize: TabBarIndicatorSize.label,
        unselectedLabelColor: AppColors.unactive,
        unselectedLabelStyle: TextStyle(fontSize: 18),
        labelColor: AppColors.active,
        labelStyle: TextStyle(fontSize: 20),
        labelPadding: EdgeInsets.symmetric(horizontal: 12)
    ),

    //设置底部导航栏按钮主题色
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.nav,
        selectedItemColor: AppColors.active,
        unselectedItemColor: AppColors.unactive,
        selectedLabelStyle: TextStyle(fontSize: 12)
    )
);