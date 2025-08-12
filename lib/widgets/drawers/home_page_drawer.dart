import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(child: Text("Menu")),
          ListTile(
            title: Text("Products", style: TextStyle(fontSize: 16.h)),
            onTap: () => {},
          ),
          ListTile(
            title: Text("I'm Admin", style: TextStyle(fontSize: 16.h)),
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}
