import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  final String username;
  final String useremail;
  const UserWidget(
      {super.key, required this.username, required this.useremail});

  @override
  Widget build(BuildContext context) {
    return Text("Автор: $username ($useremail)");
  }
}
