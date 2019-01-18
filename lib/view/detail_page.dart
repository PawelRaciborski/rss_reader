import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webfeed/domain/atom_item.dart';

class DetailPage extends StatelessWidget {
  final AtomItem item;

  DetailPage({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create our UI
    return Scaffold(
      appBar: AppBar(
        title: Text("${item.title}"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('${item.summary}'),
      ),
    );
  }
}
