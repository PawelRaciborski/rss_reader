import 'package:rss_reader/model/dates_repository.dart';

abstract class BaseUsecase<T> {
  Future<T> execute();
}

class GetDatesSizeUsecase extends BaseUsecase<int> {
  final repository = DatesRepository();

  @override
  Future<int> execute() => repository.databaseSize;
}

class GetDatesUsecase extends BaseUsecase<List<int>> {
  final repository = DatesRepository();

  @override
  Future<List<int>> execute() => repository.allDates;
}

class GetSelectedDateUsecase extends BaseUsecase<int> {
  final repository = DatesRepository();

  int _selectedIndex = 0;

  GetSelectedDateUsecase init(int index) {
    _selectedIndex = index;
    return this;
  }

  @override
  Future<int> execute() => repository.getDateAtIndex(_selectedIndex);
}
