import 'dart:developer';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/di/injection.dart';
import 'package:flutter_architecture_bloc/ui/screens/main/articles/articles_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../states/cubit/tab/tab_cubit.dart';
import '../../../states/cubit/tab/tab_state.dart';
import 'bookmark/bookmark_screen.dart';
import 'search/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _tabBloc = getIt<TabCubit>();
  final _pageController = PageController();

  List<Widget> get _pages => [
        // ignore: prefer_const_constructors
        SearchScreen(),
        // ignore: prefer_const_constructors
        ArticlesScreen(),
        // ignore: prefer_const_constructors
        BookmarkScreen(),
      ];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabCubit, TabState>(
      bloc: _tabBloc,
      builder: (context, state) {
        return Scaffold(
          body: PageView.builder(
            itemCount: _pages.length,
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _pages[_tabBloc.selectedIndex];
            },
          ),
          bottomNavigationBar: ConvexAppBar(
            style: TabStyle.reactCircle,
            items: const [
              TabItem(icon: Icons.search),
              TabItem(icon: Icons.home),
              TabItem(icon: Icons.bookmark),
            ],
            initialActiveIndex: _tabBloc.selectedIndex,
            onTap: (index) {
              _tabBloc.selectedIndex = index;
              _pageController.jumpToPage(index);
            },
          ),
        );
      },
    );
  }
}
