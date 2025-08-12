import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView(
        children: [
          ListTile(
            title: Text("About"),
            onTap: () => context.push("/account/about"),
          ),
          ListTile(
            title: Text("Profile"),
            onTap: () => context.push("/account/profile"),
          ),
          ListTile(
            title: Text("Reports"),
            onTap: () => context.push("/account/reports"),
          ),
          ListTile(
            title: Text("Admin"),
            onTap: () => context.push("/account/admin"),
          ),
          ListTile(
            title: Text("Fav"),
            onTap: () => context.push("/account/fav"),
          ),
        ],
      ),
    );
  }
}
