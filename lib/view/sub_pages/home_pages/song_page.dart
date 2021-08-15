import 'package:flutter/material.dart';
import 'package:flutter_yin_demo/Components/song_card.dart';
import 'package:flutter_yin_demo/models/song_model.dart';

class SongPage extends StatefulWidget {
  @override
  _SongPageState createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:_genSongCardList(),
    );
  }

  Widget _genSongCardList() {
    SongItem songItem =SongItem();

    List<SongItem> list = [];
    List.generate(10, (index) => list.add(songItem));

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 1,
          child: SongCard(songItem: songItem)
        );
      },
    );
  }
}