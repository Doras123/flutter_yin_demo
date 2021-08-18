import 'package:flutter/material.dart';
import 'package:flutter_yin_demo/config/app_colors.dart';
import 'package:flutter_yin_demo/utils/util.dart';

class AvatarRoleName extends StatelessWidget {
  final String avatarUrl;
  final String userName;
  final bool showType;
  String type;

  AvatarRoleName ({
    Key? key,
    required this.avatarUrl,
    required this.userName,
    this.type = '',
    this.showType = true,
  }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _avatarUrl(context),
        Offstage(
          offstage: !showType,
          child: _roleType(context),
        ), //控制roleType是否显示
        _userName(context)
      ],
    );
  }

  Widget _avatarUrl(context) {
    return SizedBox(
      width: toRpx(context, 37),
      height: toRpx(context, 37),
      child: CircleAvatar(
        backgroundColor: Colors.grey[200],
        backgroundImage:NetworkImage(avatarUrl),
        radius: 10,
      ),
    );
  }

  Widget _userName(context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: toRpx(context, 10)),
        child: Text(
          userName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColors.unactive,
            fontSize: toRpx(context, 25),
          ),
        ),
      ),
    );
  }

  Widget _roleType(context) {
    if(type.isEmpty) {
      type = '未知';
    }else {
      type = type;
    }
    return Container(
      margin: EdgeInsets.only(left: toRpx(context, 10)),
      padding: EdgeInsets.symmetric(vertical: toRpx(context, 2),
          horizontal: toRpx(context, 6)),
      decoration: BoxDecoration(
        color: Colors.black,
            borderRadius: BorderRadius.circular(4)
      ),
      child: Text(
        type,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: toRpx(context, 16)
        ),
      ),
    );
  }
}
