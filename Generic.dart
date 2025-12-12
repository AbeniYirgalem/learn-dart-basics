// Generic.dart
// Examples of generics in Dart: generic classes, generic functions, bounded types,
// generic interface and implementation, typedefs and type inference.

class Box<T> {
  T value;
  Box(this.value);
  void update(T newValue) => value = newValue;
  @override
  String toString() => 'Box<$T>($value)';
}

void swap<T>(List<T> list, int i, int j) {
  final tmp = list[i];
  list[i] = list[j];
  list[j] = tmp;
}

// Bounded generic: only numeric types allowed
num sumList<T extends num>(List<T> numbers) {
  return numbers.fold<num>(0, (prev, n) => prev + n);
}

// Bounded with Comparable to find the maximum element
T? maxOfList<T extends Comparable<T>>(List<T> items) {
  if (items.isEmpty) return null;
  var max = items.first;
  for (var i = 1; i < items.length; i++) {
    final current = items[i];
    if (current.compareTo(max) > 0) max = current;
  }
  return max;
}

// Generic typedef for comparator
typedef Comparator<T> = int Function(T a, T b);

// Generic tuple-like class
class Pair<A, B> {
  final A first;
  final B second;
  Pair(this.first, this.second);
  @override
  String toString() => 'Pair($first, $second)';
}

// Generic repository interface and in-memory implementation
abstract class Repository<T> {
  void add(T item);
  List<T> getAll();
}

class InMemoryRepository<T> implements Repository<T> {
  final List<T> _items = [];
  @override
  void add(T item) => _items.add(item);
  @override
  List<T> getAll() => List.unmodifiable(_items);
}

// A sample user type to store in a generic repository
class User {
  final int id;
  final String name;
  User(this.id, this.name);
  @override
  String toString() => 'User(id:$id, name:$name)';
}

void main() {
  // Generic class usage
  final intBox = Box<int>(42);
  final strBox = Box<String>('hello');
  print(intBox); // Box<int>(42)
  print(strBox); // Box<String>(hello)
  intBox.update(100);
  print('Updated intBox: $intBox');

  // Generic function swap
  final list = [1, 2, 3, 4];
  swap(list, 0, 3);
  print('Swapped list: $list');

  // Bounded generic function for arithmetic on nums
  final numbers = <int>[1, 2, 3, 4, 5];
  print('Sum: ${sumList(numbers)}'); // 15

  // max using Comparable bound
  final names = ['Alice', 'Bob', 'Charlie'];
  print('Max name (lexicographic): ${maxOfList(names)}');

  // Pair with two generic parameters
  final p = Pair<int, String>(1, 'one');
  print(p);

  // Generic repository usage
  final repo = InMemoryRepository<User>();
  repo.add(User(1, 'Alice'));
  repo.add(User(2, 'Bob'));
  print('Users: ${repo.getAll()}');

  // Generic typedef with a comparator
  Comparator<int> desc = (a, b) => b.compareTo(a);
  final numbers2 = [3, 1, 2];
  numbers2.sort(desc);
  print('Sorted desc: $numbers2');

  // Generic method with type inference
  T identity<T>(T v) => v;
  print('Identity<int>(5): ${identity<int>(5)}');
  print('Identity<String>("ok"): ${identity('ok')}');
}
