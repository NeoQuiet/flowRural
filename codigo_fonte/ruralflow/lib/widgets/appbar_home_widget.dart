import 'package:flutter/material.dart';

class AppBarHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 150,
      flexibleSpace: const FlexibleSpaceBar(
        title: Text(''),
      ),
    );
  }
}
