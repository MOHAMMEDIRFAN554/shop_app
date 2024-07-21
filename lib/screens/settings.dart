import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  bool salesNotifications = true;
  bool newArrivalsNotifications = false;
  bool deliveryStatusNotifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Personal Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Date of Birth',
                hintText: '12/12/1959',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Password',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: null, // Handle password change
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Notifications',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Sales Notifications'),
              value: salesNotifications,
              onChanged: (bool value) {
                setState(() {
                  salesNotifications = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('New Arrivals Notifications'),
              value: newArrivalsNotifications,
              onChanged: (bool value) {
                setState(() {
                  newArrivalsNotifications = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Delivery Status Changes'),
              value: deliveryStatusNotifications,
              onChanged: (bool value) {
                setState(() {
                  deliveryStatusNotifications = value;
                });
              },
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
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
              Navigator.pushReplacementNamed(context, '/profile');
              break;
          }
        },
      ),
    );
  }
}
