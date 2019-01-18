import 'package:flutter/material.dart';
import 'package:rss_reader/view/posts_list.dart';
import 'package:rss_reader/viewmodel/home_page_view_model.dart';
import 'package:webfeed/domain/atom_item.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _viewModel = HomePageViewModel();

  void _incrementCounter() {
    _viewModel.onAdd();
  }

  void _reset() {
    _viewModel.onReset();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: _getBody(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget _getBody() {
    return Column(
      children: <Widget>[_getList(), _getTopButtons()],
    );
  }

  Flexible _getList() => Flexible(
        child: StreamBuilder<List<AtomItem>>(
          stream: _viewModel.itemsList,
          builder: (context, snapshot) {
            return PostsList(snapshot.data ?? []);
          },
        ),
      );

  Widget _getTopButtons() {
    return RaisedButton(
      onPressed: _reset,
      child: Text("Reset"),
    );
  }
}
