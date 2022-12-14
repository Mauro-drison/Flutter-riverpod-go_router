import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proy_productos_v1/features/product/presentation/pages/home.dart';
import 'package:proy_productos_v1/features/product/presentation/pages/homepage.dart';
import 'routes/pages.dart';
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final router = ref.watch(routerprovider);
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'App Productos',
        routeInformationProvider: router.routeInformationProvider,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate
        /*
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
                    brightness: Brightness.dark, primarySwatch: Colors.purple)
                .copyWith(secondary: Colors.purpleAccent),
            textTheme: const TextTheme(
                bodyText1: TextStyle(color: Colors.black),
                bodyText2: TextStyle(color: Colors.white)),
            cardColor: Colors.purple),
        //home: const HomePage()
        */
        );
        //home: const Home());
  }
}
