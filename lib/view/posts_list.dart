import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rss_reader/view/detail_page.dart';
import 'package:webfeed/domain/atom_item.dart';

class PostsList extends StatelessWidget {
  final List<AtomItem> itemsList;

  const PostsList(this.itemsList);

  @override
  Widget build(BuildContext context) => ListView(
        children: buildTiles(context),
      );

  Widget buildTile(BuildContext context, AtomItem item) => ListTile(
        title: Text(item.title),
        subtitle: Text("Author: ${item.authors.first.name}"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailPage(item: item)),
          );
        },
      );

  List<Widget> buildTiles(BuildContext context) {
    return itemsList.map((item) => buildTile(context, item)).toList();
  }
}
