// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:food_dairy_app/controller/recipe_repository.dart';
import 'package:food_dairy_app/sql/sql.dart';
import 'package:food_dairy_app/model.dart/RecppeModel.dart';
import 'package:food_dairy_app/screen/nev_bar/page1.dart';
import 'package:food_dairy_app/screen/nev_bar/page2.dart';
import 'package:food_dairy_app/screen/settingScreen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    Get.put(RecipeRepository());
    getdata();
    super.initState();
  }

  getdata() async {
    RecipeRepository.to.updateyourrecipe([]);

    try {
      List<Map<String, dynamic>> result = await SQL.get("SELECT * FROM recipes");
      List<Recipe> recipes = result.map((map) => Recipe.fromMap(map)).toList();
      RecipeRepository.to.updateyourrecipe(recipes);
    } catch (e) {
      print("Error loading recipes: $e");
    }

    loadRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const [
          Page1(),
          Page2(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_exploration_outlined),
            label: 'Recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
