void main() {
  // List methods
  // create a list of mixed data types
  var scores = [80, 90, 70, 60, 50, "Abeni"];
  scores.removeLast();
  print(scores);

  // 2. Create a list of integers
  List<int> mylist = [1, 2, 3, 4, 5];
  // add 100 to the end of the list
  mylist.add(100);

  print(mylist);

  // 3. Create a list of strings
  List<String> names = ["Abeni", "Yirgalem", "Astu", "Kal", "Abebe"];
  // remove "Abebe" from the list
  names.remove("Abebe");
  // shuffle the list
  names.shuffle();
  print(names);

  // sort the list
  names.sort();
  print(names);

  // Set methods

  // create a mixed set of data types
  Set<dynamic> myset2 = {80, 90, 70, 60, 50, "Abeni"};
  print(myset2);

  // create a set of strings
  Set<String> myset = {"Abeni", "Yirgalem", "Astu", "Kal", "Abebe"};
  // add "Abeni" to the set but it will not be added because it already exists
  myset.add("Abeni");
  print(myset);
  // remove "Yirgalem" from the set
  myset.remove("Yirgalem");
  print(myset);
  print(myset.length);
  
}
