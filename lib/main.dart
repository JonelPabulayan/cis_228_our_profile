import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  final List<Member> members = [
    Member("Jonel", "3rd Year - A", "assets/jonel1.jpg"),
    Member("Kelly", "3rd Year - A", "assets/kelly.jpg"),
    Member("Yinlin", "3rd Year - A", "assets/yinlin.jpg"),
    Member("Changli", "3rd Year - A", "assets/changli.jpg"),
  ];

  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: members.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(member: members[index]),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(members[index].profilePic),
                    ),
                    SizedBox(height: 8),
                    Text(
                      members[index].name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(members[index].yearSection),
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

class ProfileScreen extends StatelessWidget {
  final Member member;
  const ProfileScreen({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(member.profilePic),
            ),
            SizedBox(height: 10),
            Text(
              member.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(member.yearSection, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

class Member {
  final String name;
  final String yearSection;
  final String profilePic;

  Member(this.name, this.yearSection, this.profilePic);
}
