void main(){
  Student student = Student(101, "Alice", 20);
  print("Student Name: ${student.name}, Age: ${student.age}, ID: ${student.id}");

}

// A class that represents a person
class Person {
  String name;
  int age;

  Person(this.name, this.age);

String format(){
    return "$name, $age";
  }
}

// A class that represents a student
class Student extends Person {
  int id;

  Student(this.id, super.name, super.age);

// Override the format method to include the student ID
  @override
  String format(){
    return "${super.format()}, ID: $id";
  }
}