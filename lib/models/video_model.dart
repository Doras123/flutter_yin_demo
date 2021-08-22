class VideoItem {
  late final int id;
  late final int userId;
  late final String coverPictureUrl;
  late final String videoUrl;
  late final String videoName;
  late final String type;
  late final int commentCount;
  late final int thumbUpCount;
  late final int readCount;
  late final String userName;
  late final String avatarUrl;

  VideoItem() {
    coverPictureUrl = 'https://pic1.zhimg.com/v2-162b331675fcbb191cdd85eb86538693_640w.jpg?source=12a79843';
    videoUrl = 'https://www.zhihu.com/zvideo/1348672480211656704?utm_source=pc_tab';
    videoName = '生活需要理由，懒不需要';
    type = '脱口秀';
    commentCount = 101;
    thumbUpCount = 851;
    readCount = 4223;
    userName = 'Norah脱口秀';
    avatarUrl = 'https://pic3.zhimg.com/v2-de2331af95d6f367744dd7df547c821a_im.jpg?source=12a79843';
  }
}