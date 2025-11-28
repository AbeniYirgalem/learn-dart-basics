void main() {
  // Map<key, value>
  Map<int, String> mymap = {1: "A", 2: "B", 3: "C", 4: "D", 5: "E"};

  // to print keys and values
  print(mymap);

  // to get the keys
  print(mymap.keys);

  // to get the value
  for (var key in mymap.keys) print(mymap[key]);

  // to check the key exists or not
  print(mymap.containsKey(3));

  // to check the value exists or not
  print(mymap.containsValue("C"));
}
