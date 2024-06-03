import 'package:flutter/material.dart';
import 'pages/signUp.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Moderat',
          scaffoldBackgroundColor: Colors.transparent,
        ),
        home: Container(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color(0xffF4F9FF),
                  Color(0xffE0EDFB),
                ],
                tileMode: TileMode.mirror,
              ),
            ),
            child: SafeArea(
                child: Container(
                    padding: const EdgeInsets.only(top: 94.0),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/background_stars.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                    child: const SignUp()))));
  }
}
