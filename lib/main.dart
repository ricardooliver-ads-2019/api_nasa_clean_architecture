import 'package:flutter/material.dart';
import 'package:nasa_clean_arch/app_roures.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'features/home/dependencias/dependencias.dart';
void main() {
  getItDependencias();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: asuka.builder,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRoutes.onGenerateRoute, 
    );
  }
}

