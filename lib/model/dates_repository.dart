class DatesRepository {
  final duration = Duration(milliseconds: 10);
  final dates = [
    1410,
    1411,
    1412,
    1413,
    1414,
    1415,
    1416,
    1417,
    1939,
    1990,
    2017,
    2018,
    2019,
    2020,
    2021
  ];

  Future<int> get databaseSize {
    return Future.delayed(duration, () => dates.length);
  }

  Future<int> getDateAtIndex(int index) =>
      Future.delayed(duration, () => dates[index]);
}
