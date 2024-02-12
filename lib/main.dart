import 'package:flutter/material.dart';
import 'package:spotify_skinx/feature/my_playlist/pages/my_play_list_page.dart';
import 'package:spotify_skinx/service/api_service.dart';
import 'package:spotify_skinx/setting/theme.dart';

void main() {
  ApiService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // useMaterial3: true,
        primaryColor: primaryColor,
        primarySwatch: getMaterialColor(primaryColor),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: primaryColor,
          secondary: primaryColor,
        ),
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: backgroundColor,
          iconTheme: const IconThemeData(
            color: primaryColor,
          ),
          titleTextStyle: const TextStyle(
            color: primaryColor,
            fontSize: 22,
          ),
        ),
      ),
      home: const MyPlayListPage(),
    );
  }
}
