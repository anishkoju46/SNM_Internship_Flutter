import 'package:crud_login/home.dart';
import 'package:crud_login/login.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

main() async {
  await GetStorage.init();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(useMaterial3: true),
    initialRoute: '/login',
    routes: {
      '/login': (context) => const LoginPage(),
      '/home': (context) => const HomePage(),
      //'/addLocation': (context) => const AddLocation(),
    },
  ));
}
