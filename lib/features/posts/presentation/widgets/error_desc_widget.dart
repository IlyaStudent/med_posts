import 'package:flutter/material.dart';

class ErrorDescWidget extends StatelessWidget {
  final String errorDesc;
  const ErrorDescWidget({super.key, required this.errorDesc});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorDesc,
      ),
    );
  }
}
