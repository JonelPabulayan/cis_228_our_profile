import 'package:flutter/material.dart';
import 'profile_screens/jonel_profile_screen.dart';
import 'profile_screens/kelly_profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CIS_228_OUR_PROFILE',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardScreen(),
        '/jonel_profile': (context) => const JonelProfileScreen(),
        '/kelly_profile': (context) => const KellyProfileScreen(),
      },
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  final List<Map<String, String>> members = const [
    {
      'name': 'Jonel Pabulayan',
      'year': '3rd Year',
      'section': 'Section A',
      'image': 'assets/jonel1.jpg',
      'route': '/jonel_profile',
    },
    {
      'name': 'Kelly John Noca',
      'year': '3rd Year',
      'section': 'Section A',
      'image': 'assets/kelly.jpg',
      'route': '/kelly_profile',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: members.length,
          itemBuilder: (context, index) {
            final member = members[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, member['route']!);
              },
              child: Card(
                elevation: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(member['image']!),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      member['name']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('${member['year']} - ${member['section']}'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
