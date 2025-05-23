import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footballer/core/theme/text_theme.dart';
import 'package:footballer/di/injection.dart';
import 'package:footballer/features/auth/presentation/login_screen.dart';
import 'package:footballer/features/auth/presentation/register_screen.dart';
import 'package:footballer/features/football/presentation/home/bloc/home_bloc.dart';
import 'package:footballer/features/football/presentation/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => sl<HomeBloc>(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: poppinsTextTheme, primaryTextTheme: poppinsTextTheme),
      debugShowCheckedModeBanner: false,
      home: RegisterScreen(),
    );
  }
}
