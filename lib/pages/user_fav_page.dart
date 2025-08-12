import 'package:flutter/material.dart';

class UserFavPage extends StatelessWidget {
  const UserFavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(child: Column(children: [Text("User Fav page")])),
      ),
    );
  }
}
