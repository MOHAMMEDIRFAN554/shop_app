import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart'; // Import Product model
import 'home.dart';
import 'shopping.dart';
import 'bag.dart';
import 'favorites.dart';
import 'profile.dart';
import '../widgets/navigation_bar.dart';

class MainScreen extends StatefulWidget {
  final List<Product> products; // Added products parameter

  const MainScreen({super.key, required this.products});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          HomePage(products: widget.products), // Pass products
          ShoppingPage(),
          BagPage(),
          FavoritesPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
