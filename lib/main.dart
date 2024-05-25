import 'package:flutter/services.dart';
import 'package:food_dairy_app/model.dart/RecppeModel.dart';
import 'package:food_dairy_app/sql/sql.dart';
import 'package:food_dairy_app/sql/sqllite.dart';
import 'package:food_dairy_app/screen/loginScreen.dart';
import 'package:food_dairy_app/widget/theme/app_theme.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: mainTheme.scaffoldBackgroundColor,
      statusBarBrightness: Brightness.light));
  runApp(const MyApp());
  await SQL.connection();
// var list= await loadRecipes();
//   for (var e in list) {
    
//     SQL.get("INSERT INTO dbo.Brecipes VALUES (${e.toMap()})");}
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Dairy App',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: mainTheme.scaffoldBackgroundColor),
        useMaterial3: true,
      ),

      home: const LoginScreen(),
      // HomeScreen(),
      darkTheme: mainTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
    );
  }
}
