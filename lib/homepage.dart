import 'package:flutter/material.dart';
import 'package:blog_app/followerspage.dart';
import 'package:blog_app/followingpage.dart';
import 'package:blog_app/notificationpage.dart';
import 'package:blog_app/profilepage.dart';
import 'package:blog_app/searchpage.dart';
import 'package:blog_app/uploadpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onTap(int index) {
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
            icon: _currentIndex == 0
                ? _buildHighlightedIcon(Icons.home, Colors.orange)
                : const Icon(Icons.home, color: Colors.orange),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? _buildHighlightedIcon(Icons.add_circle_outlined, Colors.red)
                : const Icon(Icons.add_circle_outlined, color: Colors.red),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? _buildHighlightedIcon(Icons.search, Colors.purpleAccent)
                : const Icon(Icons.search, color: Colors.purpleAccent),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 3
                ? _buildHighlightedIcon(Icons.notifications, Colors.blue)
                : const Icon(Icons.notifications, color: Colors.blue),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 4
                ? _buildHighlightedIcon(Icons.person, Colors.green)
                : const Icon(Icons.person, color: Colors.green),
            label: 'Profile',
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          const HomeScreen(),
          const UploadPage(),
          const SearchPage(),
          const NotificationPage(),
          const ProfilePage(),
        ],
      ),
    );
  }

  Widget _buildHighlightedIcon(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.2),
      ),
      child: Icon(
        icon,
        color: color,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const NotificationPage()));
                    },
                    child: const Icon(Icons.notifications, color: Colors.orange),
                  ),
                  Image.asset(
                    'assets/images/Blog nest logo.png',
                    width: 100,
                    height: 100,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const ProfilePage()));
                    },
                    child: Image.asset(
                      'assets/images/Profile Picture.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Text(
                'Upcoming TCS News',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Divider(thickness: 1.0),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              children: [
                _buildNewsCard(
                  headline: 'TCS Launches New AI Service',
                  postedDate: 'August 20, 2024',
                  profile: 'John Doe',
                  authorName: 'Technology Analyst',
                ),
                _buildNewsCard(
                  headline: 'TCS Q2 Results Announced',
                  postedDate: 'August 18, 2024',
                  profile: 'Jane Smith',
                  authorName: 'Finance Editor',
                ),
                _buildNewsCard(
                  headline: 'TCS Partners with Global Bank',
                  postedDate: 'August 15, 2024',
                  profile: 'Rahul Patel',
                  authorName: 'Business Correspondent',
                ),
                _buildNewsCard(
                  headline: 'TCS Expands in Europe',
                  postedDate: 'August 10, 2024',
                  profile: 'Emily Davis',
                  authorName: 'International Reporter',
                ),
                _buildNewsCard(
                  headline: 'TCS to Hire 10,000 Engineers',
                  postedDate: 'August 5, 2024',
                  profile: 'Michael Brown',
                  authorName: 'HR Specialist',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsCard({
    required String headline,
    required String postedDate,
    required String profile,
    required String authorName,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              headline,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  postedDate,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                Text(
                  '$profile - $authorName',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle wishlist action
                  },
                  icon: const Icon(Icons.bookmark_border),
                  label: const Text('Wishlist'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle share action
                  },
                  icon: const Icon(Icons.share),
                  label: const Text('Share'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TabBar extends StatefulWidget {
  const _TabBar({super.key});

  @override
  State<_TabBar> createState() => __TabBarState();
}

class __TabBarState extends State<_TabBar> {
  int _selectedTabIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              _onTabSelected(0);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            child: Text(
              'Recents',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: _selectedTabIndex == 0 ? Colors.orange : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _onTabSelected(1);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FollowingPage()),
              );
            },
            child: Text(
              'Following',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: _selectedTabIndex == 1 ? Colors.orange : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _onTabSelected(2);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FollowersPage()),
              );
            },
            child: Text(
              'Followers',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: _selectedTabIndex == 2 ? Colors.orange : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
