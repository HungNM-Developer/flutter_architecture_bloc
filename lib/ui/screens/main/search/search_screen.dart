import 'package:flutter/material.dart';

import '../../../../config/app_colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.violet,
        title: const Text('Search'),
      ),
      body: const Center(
        child: Text('Hello Search'),
      ),
    );
  }
}
