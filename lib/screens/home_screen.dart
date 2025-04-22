import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});  // Add const constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tech Hub'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Brand",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Column(
                    children: [
                      Icon(Icons.phone_iphone),
                      Text("iPhone"),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.laptop_mac),
                      Text("Asus"),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.android),
                      Text("Xiaomi"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Devices",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 250, // Adjust height for horizontal scroll
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  deviceCard(context, "iPhone 14 Pro Max", "Php 100", Icons.phone_iphone),
                  deviceCard(context, "Asus Rog Phone 6", "Php 50", Icons.laptop_mac),
                  deviceCard(context, "Xiaomi Tab", "Php 10", Icons.tablet_android),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget deviceCard(BuildContext context, String name, String price, IconData icon) {
    return GestureDetector(
      onTap: () {
        // Show details on tap
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text(name),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 48, color: Colors.blueAccent),
                const SizedBox(height: 16),
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Text(price, style: const TextStyle(color: Colors.green, fontSize: 18)),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Close"),
              ),
            ],
          ),
        );
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48),
            const SizedBox(height: 8),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(price, style: const TextStyle(color: Colors.green)),
          ],
        ),
      ),
    );
  }
}
