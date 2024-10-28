import 'package:blog_app/editprofile.dart';
import 'package:blog_app/followerspage.dart';
import 'package:blog_app/followingpage.dart';
import 'package:blog_app/homepage.dart';
import 'package:blog_app/loginpage.dart';
import 'package:blog_app/settingpage.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<String> _blogs = [
    'Blog 1',
    'Blog 2',
    'Blog 3',
    'Blog 4',
    'Blog 5',
    // Add more blog titles as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.yellow.shade800,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
      ),
      endDrawer: Drawer(
        elevation: 3.0,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('Hastik'),
              accountEmail: const Text('blognest@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: Image.asset('assets/images/Profile Picture.png', fit: BoxFit.cover),
                ),
              ),
            ),
            ListTile(
              title: const Text('Settings'),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
            const Divider(height: 0.1),
            ListTile(
              title: const Text('Privacy Policy'),
              leading: const Icon(Icons.privacy_tip_rounded),
            ),
            const Divider(height: 0.1),
            ListTile(
              title: const Text('Logout'),
              leading: const Icon(Icons.logout_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
            const Divider(height: 0.1),
            ListTile(
              leading: const Icon(Icons.person_add),
              title: const Text('Invite Friends'),
              onTap: () {
                // Handle invite friends functionality
              },
            ),
            const Divider(height: 0.1),
            ListTile(
              leading: const Icon(Icons.link),
              title: const Text('Create WhatsApp Link'),
              onTap: () {
                // Handle invite friends functionality
              },
            ),
            const Divider(height: 0.1),
            ListTile(
              leading: const Icon(Icons.link),
              title: const Text('Create Telegram Link'),
              onTap: () {
                // Handle invite friends functionality
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Profile Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.shade300,
                    backgroundImage: AssetImage('assets/images/Profile Picture.png'),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hastik',
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          _buildStatColumn('Posts', '1'),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const FollowersPage()),
                              );
                            },
                            child: _buildStatColumn('Followers', '1'),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const FollowingPage()),
                              );
                            },
                            child: _buildStatColumn('Following', '1'),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const EditProfile()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          // Color: Colors.yellow.shade800,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Edit Profile',
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Blog List
            Expanded(
              child: ListView.builder(
                itemCount: _blogs.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      title: Text(
                        _blogs[index],
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {
                        // Handle blog item tap, e.g., navigate to blog details page
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(
          title,
          style: const TextStyle(fontFamily: 'Poppins', fontSize: 16),
        ),
      ],
    );
  }
}
