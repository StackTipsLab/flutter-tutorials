class MultiSelectItem<T> {
  final T value;
  bool selected = false;

  MultiSelectItem(this.value);

  @override
  String toString() {
    return 'MultiSelectItem{value: $value, selected: $selected}';
  }
}