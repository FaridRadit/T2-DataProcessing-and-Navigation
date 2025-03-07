import 'package:flutter/material.dart';
import 'pages/cat_list_page.dart';
import 'model/cat.dart';
import 'data/cats.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
    onGenerateRoute: (settings) {
        if (settings.name == '/catdetail') {
          final cat = settings.arguments as Cat; 
          return MaterialPageRoute(
            builder: (context) => CatDetailPage(cat: cat), 
          );
        }
        return MaterialPageRoute(builder: (context) => CatListPage());
      },
    );
  }
}
