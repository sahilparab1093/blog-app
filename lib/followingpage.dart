import 'package:blog_app/followerspage.dart';
import 'package:blog_app/profilepage.dart';
import 'package:blog_app/notificationpage.dart';
import 'package:flutter/material.dart';

class FollowingPage extends StatefulWidget {
  const FollowingPage({super.key});

  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home, color: Colors.orange),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.add_circle_outlined, color: Colors.red),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search, color: Colors.purpleAccent),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications, color: Colors.blue),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person, color: Colors.green),
            label: 'Profile',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationPage()));
                      },
                      child: const Icon(Icons.arrow_back, color: Colors.orange),
                    ),
                    Image.asset('assets/images/Blog nest logo.png', width: 100, height: 100),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfilePage()));
                      },
                      child: Image.asset('assets/images/Profile Picture.png', width: 50, height: 50),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 3,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const FollowingPage()));
                    },
                    child: Text(
                      'Following',
                      style: const TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, color: Colors.orange),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const FollowersPage()));
                    },
                    child: Text(
                      'Followers',
                      style: const TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const Divider(thickness: 2.0),
              ListView.builder(
                shrinkWrap: true,  // Only as big as its children
                physics: const NeverScrollableScrollPhysics(),  // Prevent scrolling within this ListView
                itemCount: 10,  // Number of followers to display
                itemBuilder: (context, index) {
                  return _buildFollowerRow();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFollowerRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/Profile Picture.png'),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'John Doe',
                style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500, fontSize: 18),
              ),
              const Text(
                '@johndoe',
                style: TextStyle(fontFamily: 'Poppins', color: Colors.grey),
              ),
            ],
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              // Handle the "Unfollow" action
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.redAccent,
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            child: const Text(
              'Unfollow',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
