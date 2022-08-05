
abstract class Product {
  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.quantity});

  int id;

  String name;

  double price;

  int quantity;
}
