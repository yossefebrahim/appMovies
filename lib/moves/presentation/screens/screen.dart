import 'package:cleanarcitecturemmoveapp/Tv/Presentation/screens/tv_screens.dart';
import 'package:cleanarcitecturemmoveapp/moves/presentation/screens/movies_screen.dart';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  int selectedindex = 0;
  static List<Widget> widgetoptions = <Widget>[
    const MainMoviesScreen(),
    const MainTvScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(66, 195, 192, 192),
      body: widgetoptions.elementAt(selectedindex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.black12, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black12.withOpacity(0.1))
        ]),
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
          child: GNav(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            rippleColor: Colors.grey.shade300,
            hoverColor: Colors.grey.shade300,
            // curve: Curves.easeOutExpo,
            gap: 8,
            color: Colors.white,
            activeColor: Colors.white,
            duration: Duration(milliseconds: 400),
            iconSize: 24,
            tabBackgroundColor: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            tabs: const [
              GButton(
                icon: Icons.movie_creation,
                text: 'Movie',
              ),
              GButton(
                icon: Icons.tv,
                text: 'TV',
              ),
            ],
            selectedIndex: selectedindex,
            onTabChange: (index) {
              setState(() {
                selectedindex = index;
              });
            },
          ),
        )),
      ),
    );
  }
}
