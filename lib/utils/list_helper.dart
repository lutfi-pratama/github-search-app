class ListHelper {
  ListHelper._();

  static List<T> getUniqueItem<T>({required List<T> list}) {
    final tempMap = <int?, T>{};

    for (final item in list) {
      tempMap[item.hashCode] = item;
    }

    return tempMap.values.toList();
  }
}
