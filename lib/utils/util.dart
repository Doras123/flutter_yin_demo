import 'package:flutter/cupertino.dart';

///px转化为rpx
double toRpx(BuildContext context,double size) {
  double rpx = MediaQuery.of(context).size.width/750;
  return size * rpx;
}

///超过四位数的数字转化为'1.2w'格式
formatCharCount(int count) {
  if (count <= 0 || count.isNaN) {
    return '0';
  }
  String strCount = count.toString();
  if(strCount.length >= 5) {
    //38128 => 3.8w
    //381285 => 38.1w
    String prefix = strCount.substring(0,strCount.length-4);
    if(strCount.length == 5) {
      prefix += '.${strCount[1]}';
    }
    if(strCount.length == 6) {
      prefix += '.${strCount[2]}';
    }
    return prefix + 'w';
  }
  return strCount;
}