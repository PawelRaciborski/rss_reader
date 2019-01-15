import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PostsList extends StatelessWidget {
  final List<int> itemsList;

  const PostsList(this.itemsList);
  @override
  Widget build(BuildContext context) => ListView(
    children: buildTiles(),
  );

  Widget buildTile(int item) => ListTile(
        title: Text("Item $item"),
        subtitle: Text("Subtitle"),
      );

  List<Widget> buildTiles() {
    return itemsList.map((item) => buildTile(item)).toList();
  }
}
