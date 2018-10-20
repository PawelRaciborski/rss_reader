import 'package:flutter/material.dart';
import 'package:rss_reader/viewmodel/home_page_view_model.dart';

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
      body: SafeArea(
        top: false,
        bottom: false,
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              StreamBuilder<int>(
                stream: _viewModel.counterValue,
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data ?? 0}',
                    style: Theme.of(context).textTheme.display1,
                  );
                },
              ),
              Padding(
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'What\'s up, mate?',
                    labelText: 'Sum text',
                  ),
                  maxLines: 3,
                ),
                padding: EdgeInsets.all(10.0),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton.icon(
                    icon: const Icon(Icons.clear),
                    label: const Text("Reset"),
                    onPressed: () {
                      _reset();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
