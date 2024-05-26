import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  O3DController o3dController = O3DController();
  PageController mainPageController = PageController();
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          O3D(
            src: 'assets/disney_style_character.glb',
            controller: o3dController,
            ar: false,
            autoPlay: true,
            autoRotate: false,
          ),
          PageView(
            controller: mainPageController,
            children: const [
              Center(),
              Center(),
              Center(),
            ],
          ),

          Container(
            width: 100,
            height: double.infinity,
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: page,
        onTap: (page) {
          mainPageController.animateToPage(page, duration: const Duration(milliseconds: 500), curve: Curves.ease);
          setState(() {
            this.page = page;
          });
        },
        showUnselectedLabels: false,
        showSelectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_outlined),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer_outlined),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'home',
          ),
        ],
      ),
    );
  }
}
