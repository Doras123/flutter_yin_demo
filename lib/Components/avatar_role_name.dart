import 'package:flutter/material.dart';
import 'package:flutter_yin_demo/config/app_colors.dart';

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
        _avatarUrl(),
        Offstage(
          offstage: !showType,
          child: _roleType(),
        ), //控制roleType是否显示
        _userName()
      ],
    );
  }

  Widget _avatarUrl() {
    return SizedBox(
      width: 20,
      height: 20,
      child: CircleAvatar(
        backgroundColor: Colors.grey[200],
        backgroundImage:NetworkImage(avatarUrl),
        radius: 10,
      ),
    );
  }

  Widget _userName() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 6),
        child: Text(
          userName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColors.unactive,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _roleType() {
    if(type.isEmpty) {
      type = '未知';
    }else {
      type = type;
    }
    return Container(
      margin: EdgeInsets.only(left: 6),
      padding: EdgeInsets.symmetric(vertical: 2,horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.black,
            borderRadius: BorderRadius.circular(4)
      ),
      child: Text(
        type,
        style: TextStyle(
          color: Colors.white,
          fontSize: 10
        ),
      ),
    );
  }
}
