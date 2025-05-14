import 'package:flutter/material.dart';
import 'package:recipes/data/dummy_data.dart';
import 'package:recipes/models/category.dart';
import 'package:recipes/models/meal.dart';
import 'package:recipes/screens/meals.dart';
import 'package:recipes/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  Category? selectedCategory;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Meal> filteredMeals =
        selectedCategory != null
            ? widget.availableMeals
                .where((meal) => meal.categories.contains(selectedCategory!.id))
                .toList()
            : [];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Category List
          SizedBox(
            height: 80,
            child: AnimatedBuilder(
              animation: _animationController,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                itemCount: availableCategories.length,
                itemBuilder: (ctx, index) {
                  final category = availableCategories[index];
                  return Container(
                    width: 120,
                    margin: const EdgeInsets.only(right: 8),
                    child: CategoryGridItem(
                      category: category,
                      isSelected: selectedCategory?.id == category.id,
                      onSelectCategory: () {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                    ),
                  );
                },
              ),
              builder:
                  (context, child) => SlideTransition(
                    position: Tween(
                      begin: const Offset(0, 0.3),
                      end: const Offset(0, 0),
                    ).animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Curves.easeInOut,
                      ),
                    ),
                    child: child,
                  ),
            ),
          ),

          // Recipes Listt
          Expanded(
            child: Container(
              color: Colors.white,
              child:
                  selectedCategory != null
                      ? MealsScreen(
                        title: selectedCategory!.title,
                        meals: filteredMeals,
                      )
                      : Center(
                        child: Text(
                          'Wybierz kategorię',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
