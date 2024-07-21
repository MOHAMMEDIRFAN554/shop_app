import 'package:flutter/material.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  ShoppingPageState createState() => ShoppingPageState();
}

class ShoppingPageState extends State<ShoppingPage> {
  final List<String> _categories = const [
    'Women',
    'Men',
    'Kids',
  ]; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'), 
        actions: [
          IconButton(
            icon: const Icon(Icons.search), 
            onPressed: () {
              
            },
          ),
        ],
      ),
      body: DefaultTabController(
        length: _categories.length,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildCategoryTabs(),
            Expanded(
              child: _buildCategoryContent(),
            ),
          ],
        ),
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
        currentIndex: 1,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 1:
              
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

  Widget _buildCategoryTabs() {
    return Container(
      color: Colors.grey[200],
      child: TabBar(
        isScrollable: true,
        tabs: _categories.map((category) {
          return Tab(
            text: category,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCategoryContent() {
    return TabBarView(
      children: <Widget>[
        _buildWomenCategory(),
        _buildMenCategory(),
        _buildKidsCategory(),
      ],
    );
  }

  Widget _buildWomenCategory() {
    return ListView(
      padding: const EdgeInsets.all(16.0), 
      children: <Widget>[
        const Text(
          'SUMMER SALES',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          height: 200,
          color: Colors.grey[300],
          child: const Center(
              child: Text('TOP SALES IN WOMEN COLLECTION')), 
        ),
        const SizedBox(height: 16),
        _buildCategoryItem('BEAUTIFUL RED DRESS', 'lib/images/women1.jpg'),
        _buildCategoryItem('BEAUTIFUL BLACK DRESS', 'lib/images/women2.jpg'),
        _buildCategoryItem('WOMEN TOP SELLING DRESS', 'lib/images/women3.jpg'),
      ],
    );
  }

  Widget _buildMenCategory() {
    return ListView(
      padding: const EdgeInsets.all(16.0), 
      children: <Widget>[
        const Text(
          'SUMMER SALES',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          height: 200,
          color: Colors.grey[300],
          child: const Center(
              child: Text('TOP SALE IN MENS COLLECTION')),
        ),
        const SizedBox(height: 16),
        _buildCategoryItem('Casual Full sleave', 'lib/images/shirt4.jpg'),
        _buildCategoryItem(
            'Check Casual half sleave', 'lib/images/shirt5.jpeg'),
        _buildCategoryItem('Half sleave top selling', 'lib/images/shirt6.jpg'),
      ],
    );
  }

  Widget _buildKidsCategory() {
    return ListView(
      padding: const EdgeInsets.all(16.0), 
      children: <Widget>[
        const Text(
          'SUMMER SALES',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          height: 200,
          color: Colors.grey[300],
          child: const Center(
              child: Text('TOP SALE IN KIDS COLLECTION')), 
        ),
        const SizedBox(height: 16),
        _buildCategoryItem('Casual kids collection', 'lib/images/kid1.jpg'),
        _buildCategoryItem('Kids customers choice', 'lib/images/kid2.jpg'),
        _buildCategoryItem('Kids top selling', 'lib/images/kid3.jpg'),
      ],
    );
  }

  Widget _buildCategoryItem(String title, String imagePath) {
    return Card(
      child: ListTile(
        leading: Image.asset(imagePath,
            width: 60,
            height: 60),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward), 
        onTap: () {
          Navigator.pushNamed(context, '/product_detail',
              arguments: {'title': title, 'image': imagePath});
        },
      ),
    );
  }
}
