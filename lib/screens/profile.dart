import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('lib/images/user.jpg'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Mohammed Irfan',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'user@mail.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            ListTile(
              title: const Text('My Orders'),
              subtitle: const Text('Already have 2 orders'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '/orders');
              },
            ),
            ListTile(
              title: const Text('Shipping Addresses'),
              subtitle: const Text('3 addresses'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
               
              },
            ),
            ListTile(
              title: const Text('Payment Methods'),
              subtitle: const Text('Visa **34'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                
              },
            ),
            ListTile(
              title: const Text('Promocodes'),
              subtitle: const Text('You have special promocodes'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                
              },
            ),
            ListTile(
              title: const Text('My Reviews'),
              subtitle: const Text('Reviews for 4 items'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                
              },
            ),
            ListTile(
              title: const Text('Settings'),
              subtitle: const Text('Notifications, password'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, 
                ),
                child: const Text('Log Out'),
              ),
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
        currentIndex: 4,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/shop');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/bag');
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/favorites');
              break;
            case 4:
             
              break;
          }
        },
      ),
    );
  }
}
