void main() {
  print(greet(name : "Abeni", age : 23));
}

String greet({required String name, required int age}) {
  return "Hello, my name is $name and I am $age years old.";
}
