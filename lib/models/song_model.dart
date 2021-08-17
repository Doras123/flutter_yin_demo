import 'package:flutter_yin_demo/models/user_model.dart';

///歌曲每一项和详情模型
class SongItem {
  late final int id;
  late final int userId;
  late final String coverPictureUrl;
  late final String songUrl;
  late final String songName;
  late final String type;
  late final int commentCount;
  late final int thumbUpCount;
  late final int readCount;
  late final UserItem user;

  SongItem() {
    id = 1863138478;
    userId = 20210001;
    coverPictureUrl = 'https://img9.doubanio.com/view/subject/m/public/s33963585.jpg';
    songUrl ='music.163.com/outchain/player?type=2&id=1863138478&auto=1';
    songName = 'Call';
    type = 'VIP';
    commentCount = 209;
    thumbUpCount = 24677;
    readCount = 138946;
    user = UserItem();
  }
}