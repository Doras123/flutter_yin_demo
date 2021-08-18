import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter_yin_demo/config/app_colors.dart';
import 'package:flutter_yin_demo/utils/util.dart';
import 'package:flutter_yin_demo/view/sub_pages/home_pages/recommend_page/recommend_page.dart';
import 'package:url_launcher/url_launcher.dart';

class RotationChart extends StatefulWidget {
  const RotationChart({Key? key,}) : super(key: key);

  @override
  _RotationChartState createState() => _RotationChartState();
}

class _RotationChartState extends State<RotationChart> {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      autoplay: true,
      duration: 1000,
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          images[index],
          fit: BoxFit.fill,
        );
      },
      pagination: SwiperPagination(
        alignment: Alignment.bottomCenter,
        builder: DotSwiperPaginationBuilder(
          size: toRpx(context, 12),
          activeSize: toRpx(context, 16),
          color: AppColors.unactive.withOpacity(0.5),
          activeColor: Colors.white.withOpacity(0.8),
        ),
      ),
      onTap: _jumpTo,
    );
  }

  void _jumpTo(int index) async {
    const url = 'https://fm.douban.com/?from_=music_nav';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
