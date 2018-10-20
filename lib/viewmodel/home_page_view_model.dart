import 'dart:async';
import 'dart:math';

import 'package:rss_reader/model/usecases.dart';

class HomePageViewModel {
  int _counter = 0;

  final random = Random();

  Stream<int> get counterValue => _counterStreamController.stream;

  final _counterStreamController = StreamController<int>.broadcast();

  final getDatesSizeUsecase = GetDatesSizeUsecase();
  final getSelectedDateUsecase = GetSelectedDateUsecase();

  HomePageViewModel() {
    _counterStreamController.add(_counter);
  }

  Future<void> onReset() async {
    // simulate processing time
    _counter = await Future.delayed(Duration(milliseconds: 10), () => 0);
    _counterStreamController.add(_counter);
  }

  Future<void> onAdd() async {
    // simulate processing time
    var maxSize = await getDatesSizeUsecase.execute();

    var nextInt = random.nextInt(maxSize);

    _counterStreamController
        .add(await getSelectedDateUsecase.init(nextInt).execute());
  }

  void dispose() => _counterStreamController.close();
}
