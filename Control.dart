void main() {
  List<int> scores = [60, 70, 80, 90, 100];

  // 1. Write a program that prints the grade of each student in the list.
    for(int i = 0; i < scores.length; i++){
      if(scores[i] >= 90){
        print("A");
      }
      else if(scores[i] >= 80){
        print("B");
      }
      else if(scores[i] >= 70){
        print("C");
      }
      else if(scores[i] >= 60){
        print("D");
      }
      else{
        print("F");
      }
    }

  
  var mylist = [10, 20, 30, 40, 50];
  
  for (var item in mylist.where((s) => s > 30)) {
    print(item);
  }
}
