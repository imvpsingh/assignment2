import 'package:assignment/screens/image_view_screen.dart';
import 'package:assignment/screens/repo_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildAppBarTitle(_selectedIndex),
        centerTitle: true,
      ),
      body: _getPage(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Repo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Gallery',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purpleAccent,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const RepoScreen();
      case 1:
        return  GalleryPage();
      default:
        return const Center(child: Text('Unknown Page'));
    }
  }

  Widget _buildAppBarTitle(int index) {
    switch (index) {
      case 0:
        return const Text("Repo");
      case 1:
        return const Text("Gallery");
      default:
        return const Text("Unknown");
    }
  }
}
