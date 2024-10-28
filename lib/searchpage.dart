import 'package:flutter/material.dart';
import 'package:blog_app/homepage.dart'; // Import your HomePage

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _searchResults = [
    'Blog 1',
  ];

  String _searchQuery = '';

  List<String> _filterResults() {
    if (_searchQuery.isEmpty) {
      return _searchResults;
    }
    return _searchResults
        .where((result) => result.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.black),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage())); // Navigate back to the previous screen
          },
        ),
        title: const Text(
          'Search',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Search bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (query) {
                    setState(() {
                      _searchQuery = query;
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search by title...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              // Search results
              Expanded(
                child: ListView.builder(
                  itemCount: _filterResults().length,
                  itemBuilder: (context, index) {
                    final result = _filterResults()[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(8.0),
                        title: Text(
                          result,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          // Handle item tap, e.g., navigate to details page
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
