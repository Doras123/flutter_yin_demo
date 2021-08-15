///文章列表每一项和详情模型
class Content {
  late String title;
  late String subTitle;
  late String avatrUrl;
  late String userName;
  late String userDesc;
  late int thumbUpCount;
  late int commentCount;

  Content() {
    title = '你现在的微信顶置文案是什么？';
    subTitle = '当代年轻人的爱情，刚开始都爱得死去活来， 但在一起久了就会发现，生活并非想象中那般美好。 每天都有无数个阻挠「爱情」…';
    avatrUrl = 'https://pic4.zhimg.com/v2-58a3b25840defd0e3f9daad324b3a4ff_xll.jpg';
    userName = '草头哥';
    userDesc = '狮子座、有点皮';
    thumbUpCount = 4657;
    commentCount = 258;
  }
}
