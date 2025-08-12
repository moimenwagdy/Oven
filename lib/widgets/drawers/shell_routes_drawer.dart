import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ShellRoutesDrawer extends StatelessWidget {
  const ShellRoutesDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: Colors.black,
      child: Column(
        children: [
          DrawerHeader(child: Text("Menu")),
          ListTile(
            title: Text("Home", style: TextStyle(fontSize: 16.h)),
            visualDensity: VisualDensity(vertical: -4),
            onTap: () => context.push("/home"),
          ),
          ListTile(
            title: Text("Favorite Items", style: TextStyle(fontSize: 16.h)),
            onTap: () => context.push("/fav"),
            visualDensity: VisualDensity(vertical: -4),
          ),
          ListTile(
            title: Text("Profile", style: TextStyle(fontSize: 16.h)),
            onTap: () => context.push("/Profile"),
            visualDensity: VisualDensity(vertical: -4),
          ),
          ListTile(
            title: Text("About", style: TextStyle(fontSize: 16.h)),
            onTap: () => context.push("/about"),
            visualDensity: VisualDensity(vertical: -4),
          ),
          ListTile(
            title: Text("I'm Admin", style: TextStyle(fontSize: 16.h)),
            onTap: () => context.push("/admin"),
            visualDensity: VisualDensity(vertical: -4),
          ),
          ListTile(
            title: Text("Report issue", style: TextStyle(fontSize: 16.h)),
            onTap: () => context.push("/reports"),
            visualDensity: VisualDensity(vertical: -4),
          ),
        ],
      ),
    );
  }
}
