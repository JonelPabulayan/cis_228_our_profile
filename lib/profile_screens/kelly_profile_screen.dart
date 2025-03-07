import 'dart:developer';

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

class KellyProfileScreen extends StatefulWidget {
  const KellyProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<KellyProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  final Map<String, bool> _interests = {
    'Motorcycle Touring': false,
    'Watching Movies': false,
    'Playing Games': false,
  };

  void _submitForm() {
    String name = _nameController.text;
    String email = _emailController.text;
    String bio = _bioController.text;
    List<String> selectedInterests =
        _interests.entries
            .where((entry) => entry.value)
            .map((entry) => entry.key)
            .toList();

    log("Name: $name");
    log("Email: $email");
    log("Bio: $bio");
    log("Interests: ${selectedInterests.join(', ')}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kelly Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/kelly.jpg'),
            ),
            const SizedBox(height: 20),

            // Name TextField
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            // Email TextField
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Enter your email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),

            // Bio TextField
            TextField(
              controller: _bioController,
              decoration: const InputDecoration(
                labelText: 'A Short Bio About Yourself',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 10),

            // Interests Checkboxes
            const Text(
              "Select your interests:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Column(
              children:
                  _interests.keys.map((String key) {
                    return CheckboxListTile(
                      title: Text(key),
                      value: _interests[key],
                      onChanged: (bool? value) {
                        setState(() {
                          _interests[key] = value ?? false;
                        });
                      },
                    );
                  }).toList(),
            ),

            // Submit Button
            ElevatedButton(onPressed: _submitForm, child: const Text("Submit")),
          ],
        ),
      ),
    );
  }
}
