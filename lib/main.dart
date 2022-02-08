import 'package:flutter/material.dart';
import 'package:flutter_meme_generator/widgets/infinite_scroll_view.dart';
import 'package:flutter_meme_generator/providers/templates_provider.dart';
import 'package:flutter_meme_generator/widgets/custom_search_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => TemplatesProvider(),
          lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meme generator',
      home: Scaffold(
          appBar: AppBar(
              title: const CustomSearchBar(),
              backgroundColor: TemplatesProvider.appColor),
          body: const Center(child: InfiniteScrollView())),
    );
  }
}
