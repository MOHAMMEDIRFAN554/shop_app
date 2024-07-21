import 'package:flutter/material.dart';
import '../models/product.dart';

class CartItem extends StatelessWidget {
  final Product product;
  final int quantity;
  final VoidCallback onRemove;
  final VoidCallback onAdd;

  const CartItem({
    Key? key,
    required this.product,
    required this.quantity,
    required this.onRemove,
    required this.onAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(product.image),
        title: Text(product.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Price: \$${product.price.toStringAsFixed(2)}'),
            Row(
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: onRemove,
                ),
                Text('$quantity'),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: onAdd,
                ),
              ],
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            
          },
        ),
      ),
    );
  }
}
