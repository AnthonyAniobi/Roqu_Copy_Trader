import 'package:flutter/material.dart';

class PageNotFoundScreen extends StatelessWidget {
  const PageNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('404 - Page Not Found', style: TextStyle(fontSize: 12)),
      ),
    );
  }
}
