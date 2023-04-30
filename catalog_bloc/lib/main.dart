import 'package:catalog_bloc/ui/cart.dart';
import 'package:catalog_bloc/ui/catalog.dart';
import 'package:catalog_bloc/ui/user.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'State Management',
      theme: ThemeData.light(),
      initialRoute: '/',
      routes: {
        '/': (context) => CatalogScreen(),
        '/user': (context) => UserScreen(),
        '/cart': (context) => CartScreen(),
      },
    );
  }
}