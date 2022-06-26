import 'package:flutter/material.dart';
import 'package:newsfeeds/style/style.dart';
import 'package:newsfeeds/viewmodels/head_line_viewmodel.dart';
import 'package:newsfeeds/viewmodels/news_list_viewmodel.dart';
import 'package:provider/provider.dart';
import 'view/screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NewsListViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => HeadLineViewModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NewsFeed',
      theme: ThemeData(brightness: Brightness.dark, fontFamily: BoldFont),
      home: HomeScreen(),
    );
  }
}
