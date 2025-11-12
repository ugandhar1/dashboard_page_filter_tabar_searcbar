import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Portfolio App',
        theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: const Color(0xFFFF6A00),
          scaffoldBackgroundColor: Colors.white,
        ),
        home: child,
      ),
      child: const AppPage(),
    );
  }
}
