import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CIS 228 Assignment 3',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const KellyProfileScreen(),
    );
  }
}

class KellyProfileScreen extends StatelessWidget {
  const KellyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kelly Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Picture
                Center(
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/kelly.jpg'),
                  ),
                ),
                const SizedBox(height: 20),

                // Name
                const Text(
                  "Name:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text("Kelly John Noca", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 10),

                // Email
                const Text(
                  "Email:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "kelly123@gmail.com",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),

                // Bio
                const Text(
                  "Bio:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "I like playing games.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),

                // Interests
                const Text(
                  "Interests:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "- Motorcycle Touring\n- Playing Games\n- Watching Movies",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
