void main() {
  MenuItem item = MenuItem("pizza", 7.88);
  Pizza pizza = Pizza(["cheese", "pepperoni"], "Deluxe Pizza", 12.99);


  print("Item: ${item.getTitle()}, Price: \$${item.getPrice()}");
  
  print("Pizza: ${pizza.getTitle()}, Price: \$${pizza.getPrice()}, Toppings: ${pizza.toppings}");
}

// A class that represents a menu item
class MenuItem {
  String title;
  double price;

  MenuItem(this.title, this.price);

  String getTitle() {
    return title;
  }

  double getPrice() {
    return price;
  }
}

// A class that represents a pizza item in a menu
class Pizza extends MenuItem {
  List<String> toppings;

  Pizza(this.toppings, super.title, super.price);
}
