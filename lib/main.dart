import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today/bloc/cubit.dart';
import 'package:today/bloc/states.dart';
import 'package:today/dio/diohelper.dart';
import 'package:today/screens/news.dart';

void main() {
  dioHelper.intHelper();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => newsCubit()
                ..getDatabussenss()
                ..getDataentertainment()
                ..getDatasports()
                ..getDatascience()
                ..getDatatechnology()
                ..getDatahealth()),
        ],
        child: BlocConsumer<newsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: newsCubit.get(context).isDark
                  ? ThemeMode.light
                  : ThemeMode.dark,
              theme: ThemeData(
                  scaffoldBackgroundColor: Colors.white,
                  textTheme: const TextTheme(
                    bodyText1: TextStyle(color: Colors.black, fontSize: 25),
                    bodyText2: TextStyle(color: Colors.grey, fontSize: 15),
                    caption: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  iconTheme: const IconThemeData(size: 30, color: Colors.black),
                  drawerTheme: const DrawerThemeData(
                      elevation: 40, backgroundColor: Colors.white),
                  appBarTheme: const AppBarTheme(
                      iconTheme: IconThemeData(color: Colors.black, size: 25),
                      titleTextStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      backgroundColor: Colors.white,
                      elevation: 0,
                      actionsIconTheme:
                          IconThemeData(color: Colors.black, size: 27))),
              darkTheme: ThemeData(
                  scaffoldBackgroundColor: Colors.black,
                  iconTheme: const IconThemeData(size: 30, color: Colors.white),
                  drawerTheme: const DrawerThemeData(
                    scrimColor: Colors.white,
                    elevation: 40,
                    backgroundColor: Colors.black,
                  ),
                  textTheme: const TextTheme(
                    bodyText1: TextStyle(color: Colors.white, fontSize: 25),
                    bodyText2: TextStyle(color: Colors.grey, fontSize: 15),
                    caption: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  appBarTheme: const AppBarTheme(
                      iconTheme: IconThemeData(color: Colors.white, size: 25),
                      titleTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      backgroundColor: Colors.black,
                      elevation: 0,
                      actionsIconTheme:
                          IconThemeData(color: Colors.white, size: 27))),
              home: news(),
            );
          },
        ));
  }
}
