import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/cart_item.dart';
import '../widgets/navigation_bar.dart';

class BagPage extends StatefulWidget {
  const BagPage({Key? key}) : super(key: key);

  @override
  BagPageState createState() => BagPageState();
}

class BagPageState extends State<BagPage> {
  List<Product> cart = [
    Product(
      id: 1,
      name: 'Shirt 1',
      description: 'Description',
      price: 29.99,
      image: 'lib/images/shirt1.jpg',
      isExclusive: false,
    ),
    Product(
      id: 2,
      name: 'Shirt 2',
      description: 'Description',
      price: 39.99,
      image: 'lib/images/shirt2.jpg',
      isExclusive: false,
    ),
  ];

  Map<int, int> quantities = {
    1: 1,
    2: 2,
  };

  String? _appliedPromoCode;
  double _discount = 0.0;
  String? _message;

  final List<Map<String, String>> _promoCodes = [
    {'code': 'sale50', 'description': '50% off'},
    {'code': 'happy20', 'description': '20% off'},
    {'code': 'smart30', 'description': '30% off'},
  ];

  double get totalAmount {
    double total = 0;
    for (var product in cart) {
      final quantity = quantities[product.id] ?? 0;
      total += product.price * quantity;
    }
    return total * (1 - _discount);
  }

  void _removeFromCart(Product product) {
    setState(() {
      final quantity = quantities[product.id] ?? 0;
      if (quantity > 1) {
        quantities[product.id] = quantity - 1;
      } else {
        cart.remove(product);
        quantities.remove(product.id);
      }
    });
  }

  void _addToCart(Product product) {
    setState(() {
      final quantity = quantities[product.id] ?? 0;
      quantities[product.id] = quantity + 1;
    });
  }

  void _applyPromoCode(String code) {
    setState(() {
      if (_appliedPromoCode != code) {
        switch (code) {
          case 'sale50':
            _discount = 0.50;
            break;
          case 'happy20':
            _discount = 0.20;
            break;
          case 'smart30':
            _discount = 0.30;
            break;
          default:
            _discount = 0.0;
            break;
        }
        _appliedPromoCode = code;
        _message =
            'Congratulations! Promo code "$code" applied. You saved \$${(totalAmount / (1 - _discount) - totalAmount).toStringAsFixed(2)}';
      } else {
        _discount = 0.0;
        _appliedPromoCode = null;
        _message = 'Promo code removed.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bag'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: cart.isEmpty
          ? const Center(
              child: Text('No items in your cart'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final product = cart[index];
                      final quantity = quantities[product.id] ?? 0;
                      return CartItem(
                        product: product,
                        quantity: quantity,
                        onRemove: () => _removeFromCart(product),
                        onAdd: () => _addToCart(product),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Promo Code List
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _promoCodes.map((promo) {
                            final isSelected =
                                promo['code'] == _appliedPromoCode;
                            return ListTile(
                              title: Text(promo['code']!),
                              subtitle: Text(promo['description']!),
                              tileColor: isSelected ? Colors.blue[100] : null,
                              onTap: () => _applyPromoCode(promo['code']!),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text('Total amount: \$${totalAmount.toStringAsFixed(2)}'),
                      if (_message != null) ...[
                        const SizedBox(height: 10),
                        Text(_message!,
                            style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold)),
                      ],
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/checkout');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text('CHECK OUT'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: 2,
        onItemTapped: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/shopping');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/bag');
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/favorites');
              break;
            case 4:
              Navigator.pushReplacementNamed(context, '/profile');
              break;
          }
        },
      ),
    );
  }
}
