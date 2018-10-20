import 'dart:async';

class HomePageViewModel {
  int _counter = 0;

  Stream<int> get counterValue => _counterStreamController.stream;

  final _counterStreamController = StreamController<int>.broadcast();

  HomePageViewModel() {
    _counterStreamController.add(_counter);
  }

  Future<void> onReset() async {
    // simulate processing time
    _counter = await Future.delayed(Duration(seconds: 1), () => 0);
    _counterStreamController.add(_counter);
  }

  Future<void> onAdd() async {
    // simulate processing time
    _counter = await Future.delayed(Duration(seconds: 1), () => _counter + 1);
    _counterStreamController.add(_counter);
  }

  void dispose() => _counterStreamController.close();
}
