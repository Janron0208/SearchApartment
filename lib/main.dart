import 'package:flutter/material.dart';
import 'package:scanapartment/authen/signin.dart';


main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.grey,
          fontFamily: 'Prompt',
           scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
      title: 'HaHorPak หาหอพัก',
      home: SignIn(),
    );
  }
}
