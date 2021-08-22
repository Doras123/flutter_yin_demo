///用户列表每一项和详情模型
class UserItem {
  late final int userId;
  late final String avatarUrl;
  late final String userName;
  late final String type;
  late final int musicCount;
  late final int musicPlayCount;

  UserItem() {
    userId = 20210001;
    avatarUrl ='https://img2.doubanio.com/view/subject/m/public/s30018792.jpg';
    userName = '宣美 선미';
    type = '歌手';
    musicCount = 6;
    musicPlayCount = 9878;
  }
}