import 'package:flutter/material.dart';
import 'package:newsfeeds/about_us_page.dart';
import 'package:newsfeeds/head_line_page.dart';
import 'package:newsfeeds/news_list_page.dart';
import 'package:newsfeeds/style/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final _pages = [
    HeadLinePage(),
    NewsListPage(),
    AboutUsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
          icon: Icon(Icons.highlight),
        label: 'トップニュース',
      ),
    BottomNavigationBarItem(
        icon: const Icon(Icons.list),
      label: 'ニュース一覧',
    ),
        BottomNavigationBarItem(
            icon: const Icon(Icons.info),
        label: 'このアプリについて'),
          ],
        onTap: (index) {
            setState(() {
              _currentIndex = index;
            },
            );
        },),
    ),
    );
    }
}

