class Order {
  final int id;
  final int productId;
  final int quantity;
  final double totalPrice;
  final String date;

  Order({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.totalPrice,
    required this.date,
  });

  factory Order.fromMap(Map<String, dynamic> json) => Order(
        id: json["id"],
        productId: json["productId"],
        quantity: json["quantity"],
        totalPrice: json["totalPrice"],
        date: json["date"],
      );

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "productId": productId,
      "quantity": quantity,
      "totalPrice": totalPrice,
      "date": date,
    };
  }
}
