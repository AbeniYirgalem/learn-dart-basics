# Learn Dart Basics (Flutter-friendly)

Welcome! This repository contains simple, self-contained Dart examples that demonstrate core language features. These examples are aimed at beginners who want to learn Dart basics using small, focused scripts. While the project has not been scaffolded as a full Flutter app, the code is Dart-first and can be used inside a Flutter project or run as standalone Dart scripts.

---

## What you'll learn

- Dart variables, types, and operators
- Lists, Sets, and Maps
- Control flow (if/else, for loops, for-in)
- Functions, named parameters, and return values
- Classes, constructors and simple inheritance
- Method overriding
- Generics (classes, functions, bounds)
- Futures, async/await and error handling
- Basic HTTP networking via dart:io (a CLI example)

---

## Requirements

- Dart SDK (2.10+) — To run the standalone Dart examples
- Optional: Flutter SDK — When you want to integrate code into a Flutter app or run on devices

You can verify the Dart and Flutter installations with:

```powershell
# Dart
dart --version

# Flutter (optional)
flutter --version
```

---

## Run the examples

From the repository root, run a single example file using the Dart CLI:

```powershell
# Example: run the main variables example
dart run main.dart

# Run another example
dart run datatypes.dart
```

Notes:

- `FetchingData.dart` uses dart:io and `HttpClient`. Run it from the CLI (not in a browser) and ensure you have network access:
  ```powershell
  dart run FetchingData.dart
  ```
- Most other examples are pure Dart and will run in the Dart VM (and most can be ported into Flutter).

To run inside an existing Flutter app, copy the example code into a `lib/` file and include the code as part of your app. If you are creating a new Flutter app:

```powershell
flutter create my_app
cd my_app
# Replace lib/main.dart or add new files and import them
flutter run -d chrome # for web
flutter run # for connected device/emulator
```

---

## Files and what they demonstrate

- `main.dart` — Basic variable usage: var, final, const
- `datatypes.dart` — Demonstrates Dart primitive types, List, Map and Set
- `math.dart` — Basic arithmetic and operators
- `ListSets.dart` — List and Set methods (add, remove, shuffle, sort)
- `map.dart` — Basic Map usage and common access patterns
- `functions.dart` — Named parameters and simple function example
- `Control.dart` — Control flow examples (if/else, for loop, conditional iteration)
- `class.dart` — Classes, constructor syntax and inheritance
- `MethodOverriding.dart` — Inheritance with overridden methods
- `Generic.dart` — Generics (Box<T>, Pair<A,B>, generic functions) and bounded types
- `Future.dart` — Asynchronous programming, futures, error handling, and concurrency
- `FetchingData.dart` — CLI networking example using `dart:io`'s `HttpClient` (GET/POST)

---

## Tips

- If you're new to Dart, start with `main.dart` and `datatypes.dart`, then move on to `functions.dart` and `class.dart`.
- Use `Future.dart` and `FetchingData.dart` to experiment with async/await and HTTP calls.
- To test code snippets quickly, consider using the DartPad online editor for pure Dart examples (note: `dart:io` network code won't run in DartPad).

---

## Contributing

Want to add more examples? Open a pull request with an additional Dart example and a short explanation. Please include:

- A short description of the new example
- When/how to run it
- Any special notes for platform-specific features

---

## License

This project is provided for learning purposes. You can reuse the code freely — add a license file if you wish to standardize reuse rules.

---

Happy learning!
