import 'dart:async';
import 'dart:math';

import 'package:rss_reader/model/usecases.dart';

class HomePageViewModel {
  int _counter = 0;

  final random = Random();

  Stream<int> get counterValue => _counterStreamController.stream;

  Stream<List<int>> get datesList => _datesListStreamController.stream;

  final _counterStreamController = StreamController<int>.broadcast();

  final _datesListStreamController = StreamController<List<int>>.broadcast();

  final getDatesSizeUsecase = GetDatesSizeUsecase();
  final getSelectedDateUsecase = GetSelectedDateUsecase();
  final getDatesUsecase = GetDatesUsecase();
  final getAllFeedsUsecase = GetAllFeedsUsecase();

  HomePageViewModel() {
    _counterStreamController.add(_counter);
    _loadList();
  }

  Future<void> _loadList() async {
    var list = await getDatesUsecase.execute();
    _datesListStreamController.add(list);
  }

  Future<void> onReset() async {
    // simulate processing time
//    _counter = await Future.delayed(Duration(milliseconds: 10), () => 0);
//    _counterStreamController.add(_counter);
    _datesListStreamController.add([]);
  }

  Future<void> onAdd() async {
    // simulate processing time
//    var maxSize = await getDatesSizeUsecase.execute();
//
//    var nextInt = random.nextInt(maxSize);
//
//    _counterStreamController
//        .add(await getSelectedDateUsecase.init(nextInt).execute());
    await _loadList();
  }

  void dispose() {
    _counterStreamController.close();
    _datesListStreamController.close();
  }
}
