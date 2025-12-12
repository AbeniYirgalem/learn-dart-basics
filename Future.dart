// Examples of Async, Await & Futures in Dart

import 'dart:async';

// 1) A simple async function that simulates a network request
Future<String> fetchUserOrder() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Coffee';
}

// 2) Future that returns a value after a delay
Future<int> doubleAfterDelay(int value, int seconds) {
  return Future.delayed(
    Duration(seconds: seconds),
    () => value * 2,
  );
}

// 3) A Future that sometimes throws an error
Future<String> sometimesFails(bool fail) async {
  await Future.delayed(Duration(milliseconds: 500));
  if (fail) throw Exception('Operation failed');
  return 'All good';
}

Future<void> main() async {
  // 1) Basic async/await
  print('1) async/await example:');
  final order = await fetchUserOrder();
  print('  Received order: $order\n');

  // 2) Using then() & catchError()
  print('2) then() & catchError() example:');
  doubleAfterDelay(3, 1).then((value) {
    print('  Doubling done with then(): $value');
  }).catchError((e) {
    print('  Error in then: $e');
  });

  // Allow non-awaited Future to finish
  await Future.delayed(Duration(milliseconds: 1100));

  // 3) Handling errors using try/catch with await
  print('\n3) try/catch with await example:');
  try {
    final result = await sometimesFails(true);
    print('  Result: $result');
  } catch (e) {
    print('  Caught error: $e');
  }

  // 4) Immediate Futures (Future.value & Future.error)
  print('\n4) Future.value & Future.error example:');
  final immediate = await Future.value('Immediate result');
  print('  $immediate');

  try {
    await Future.error(Exception('Immediate exception'));
  } catch (e) {
    print('  Caught immediate error: $e');
  }

  // 5) Running multiple Futures concurrently using Future.wait
  print('\n5) Future.wait (concurrent futures):');
  final futures = [
    doubleAfterDelay(2, 1),
    doubleAfterDelay(3, 2),
    doubleAfterDelay(5, 3),
  ];

  final results = await Future.wait(futures);
  print('  Concurrent results: $results (sum: ${results.reduce((a, b) => a + b)})');

  // 6) Using timeout for slow operations
  print('\n6) timeout example:');
  try {
    final slowResult = await Future.delayed(
      Duration(seconds: 3),
      () => 'slow',
    ).timeout(Duration(seconds: 1));

    print('  Got: $slowResult');
  } on TimeoutException catch (e) {
    print('  Timeout occurred: $e');
  }

  // 7) Non-awaited future with error handling
  print('\n7) Non-awaited future with catchError:');
  Future.delayed(Duration(milliseconds: 100)).then((_) {
    throw Exception('boom');
  }).catchError((e) {
    print('  Caught thrown from non-awaited future: $e');
  });

  // Give time for non-awaited future to run
  await Future.delayed(Duration(seconds: 1));

  print('\nDone.');
}
