import 'dart:async';
import 'dart:math';

import 'package:rss_reader/model/usecases.dart';
import 'package:webfeed/domain/atom_item.dart';

class HomePageViewModel {
  int _counter = 0;

  final random = Random();

  Stream<int> get counterValue => _counterStreamController.stream;

  Stream<List<AtomItem>> get itemsList => _itemsStreamController.stream;

  final _counterStreamController = StreamController<int>.broadcast();

  final _itemsStreamController = StreamController<List<AtomItem>>.broadcast();

  final getDatesSizeUsecase = GetDatesSizeUsecase();
  final getSelectedDateUsecase = GetSelectedDateUsecase();
  final getDatesUsecase = GetDatesUsecase();
  final getAllFeedsUsecase = GetAllFeedsUsecase();

  HomePageViewModel() {
    _counterStreamController.add(_counter);
    _loadList();
  }

  Future<void> _loadList() async {
    var feed = await getAllFeedsUsecase.execute();
    _itemsStreamController.add(feed.items);
  }

  Future<void> onReset() async {
    // simulate processing time
//    _counter = await Future.delayed(Duration(milliseconds: 10), () => 0);
//    _counterStreamController.add(_counter);
    _itemsStreamController.add([]);
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
    _itemsStreamController.close();
  }
}
