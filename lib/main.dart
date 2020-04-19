import 'package:flutter/material.dart';
import 'package:my_password/module/home/features/home/page/home_page.dart';
import 'package:my_password/route/route_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Password',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
      onGenerateRoute: RouteGenerator().generateRoutes,
    );
  }
}
