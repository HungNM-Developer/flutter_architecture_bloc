import 'package:flutter/material.dart';

import '../../../../config/app_colors.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.violet,
        title: const Text('Bookmark'),
      ),
      body: const Center(
        child: Text('book mark'),
      ),
    );
  }
}
