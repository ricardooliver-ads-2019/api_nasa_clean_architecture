import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_clean_arch/features/home/dependencias/dependencias.dart';
import 'package:nasa_clean_arch/features/home/presenter/cubitController/cubit_controller.dart';
import 'package:nasa_clean_arch/features/home/presenter/home_screen.dart';
import 'package:nasa_clean_arch/features/home/presenter/media_screen.dart';

class AppRoutes {
  static const home = '/home';
  static const screenMedia = '/media';

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case AppRoutes.screenMedia:
        DateTime date;
        date = settings.arguments as DateTime;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getItDependencia.get<CubitController>(),
            child: MediaScreen(dateSelected: date),
          ),
        );

      default:
        return null;
    }
  }
}
