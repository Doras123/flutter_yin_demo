import 'package:flutter/material.dart';
import 'package:flutter_yin_demo/Components/list_view_card.dart';
import 'package:flutter_yin_demo/models/content_model.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: genContentList()
    );
  }

  Widget genContentList() {
    Content content =Content();

    List<Content> list = [];
    List.generate(10, (index) => list.add(content));

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 1,
          child: ListViewCard(content: content),
        );
      },
    );
  }
}