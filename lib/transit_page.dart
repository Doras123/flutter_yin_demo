import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_yin_demo/utils/util.dart';

import 'root_page.dart';

class TransitPage extends StatefulWidget {
  @override
  _TransitPageState createState() => _TransitPageState();
}

class _TransitPageState extends State<TransitPage> {
  int _currentTime = 5;
  late Timer _timer;

  //跳转按钮倒计时
  @override
  void initState() {
    super.initState();
    //定时器（每执行一次回调一次方法）
    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        _currentTime --;
      });
      //倒计时为0时自动跳转到首页
      if(_currentTime <= 0) {
        _jumpToRootPage();
      }
    });
  }

  void _jumpToRootPage() {
    _timer.cancel();  //跳转后取消定时器
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => RootPage(),  // =>等同于{return}
      ),
      (route) => false
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/common/transit_page.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,  //获取设备的宽度
            height: MediaQuery.of(context).size.height,  //获取设备的高度
          ),
          //设置启动页跳过按钮的位置
          Positioned(
            top: MediaQuery.of(context).padding.top+toRpx(context, 20),//获取状态栏高度后加10px
            right: toRpx(context, 20),
            child: InkWell(
              child: _clipButton(context),
              onTap: _jumpToRootPage,
            ),
          )
        ],
      ),
    );
  }

  Widget _clipButton(context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: toRpx(context, 100),
        height: toRpx(context, 44),
        color: Colors.black.withOpacity(0.3),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: toRpx(context, 12)),
              child: Text(
                '跳过',
                style: TextStyle(color: Colors.white,fontSize: toRpx(context, 22)),
              ),
            ),
            Text(
              '$_currentTime',
              style: TextStyle(color: Colors.deepOrange,fontSize: toRpx(context, 24)),
            ),
          ],
        ),
      ),
    );
  }
}

