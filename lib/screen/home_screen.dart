import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:o3d/o3d.dart';
import 'package:ui_three_d_apps/widget/inverted_circle_clipper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  O3DController o3dController = O3DController();
  PageController mainPageController = PageController();
  PageController textsPageController = PageController();
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Stack(
        children: [
          O3D(
            src: 'assets/disney_style_character.glb',
            controller: o3dController,
            ar: false,
            autoPlay: true,
            autoRotate: false,
            cameraControls: false,
            cameraTarget: CameraTarget(-.25, 1.5, 1.5),
            cameraOrbit: CameraOrbit(0, 90, 1),
          ),
          PageView(
            controller: mainPageController,
            children: [
              Center(),
              Center(),
              ClipPath(
                clipper: InvertedCircleClipper(),
                child: Container(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Container(
            width: 100,
            height: double.infinity,
            margin: const EdgeInsets.all(12),
            child: PageView(
              controller: textsPageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Column(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text("Daily Goals"),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          const Expanded(
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text("87"),
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(0, 20),
                            child: const Text("%"),
                          )
                        ],
                      ),
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.local_fire_department,
                          color: Colors.red,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text("1,840"),
                              Text(
                                "calories",
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text("Daily Goals"),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          const Expanded(
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text("87"),
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(0, 20),
                            child: const Text("%"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text("Daily Goals"),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          const Expanded(
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text("87"),
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(0, 20),
                            child: const Text("%"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: page,
        onTap: (page) {
          mainPageController.animateToPage(page,
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
          textsPageController.animateToPage(page,
              duration: const Duration(milliseconds: 500), curve: Curves.ease);

          if (page == 0) {
            o3dController.cameraTarget(-.25, 1.5, 1.5);
            o3dController.cameraOrbit(0, 90, 1);
          } else if (page == 1) {
            o3dController.cameraTarget(0, 1.8, 0);
            o3dController.cameraOrbit(-90, 90, 1.5);
          } else if (page == 2) {
            o3dController.cameraTarget(0, 3, 0);
            o3dController.cameraOrbit(0, 90, -3);
          }

          setState(() {
            this.page = page;
          });
        },
        showUnselectedLabels: false,
        showSelectedLabels: false,
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
