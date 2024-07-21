import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class FavoritesPage extends StatelessWidget {
  final List<Product> favoriteProducts = [
    Product(
      id: 1,
      name: 'Shirt 1',
      description: 'A nice shirt',
      price: 29.99,
      image: 'lib/images/shirt1.jpg',
      isExclusive: false,
    ),
    Product(
      id: 2,
      name: 'Shirt 2',
      description: 'Another nice shirt',
      price: 34.99,
      image: 'lib/images/shirt2.jpg',
      isExclusive: false,
    ),
  ];

  FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: favoriteProducts.isEmpty
          ? const Center(child: Text('No favorites yet!'))
          : GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.75,
              ),
              itemCount: favoriteProducts.length,
              itemBuilder: (context, index) {
                final product = favoriteProducts[index];
                return ProductCard(
                  product: product,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/product_detail',
                      arguments: product,
                    );
                  },
                );
              },
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Bag'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 3,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
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
              // Current page
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
