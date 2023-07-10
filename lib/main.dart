import 'dart:convert';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Recipe {
  final String title;
  final String description;
  final List<String> ingredients;

  Recipe({required this.title, required this.description, required this.ingredients});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      title: json['title'],
      description: json['description'],
      ingredients: List<String>.from(json['ingredients']),
    );
  }
}

class MyApp extends StatelessWidget {
  final String jsonStr = '''
{
  "recipes": [
    {
      "title": "Pasta Carbonara",
      "description": "Creamy pasta dish with bacon and cheese.",
      "ingredients": ["spaghetti", "bacon", "egg", "cheese"]
    },
    {
      "title": "Caprese Salad",
      "description": "Simple and refreshing salad with tomatoes, mozzarella, and basil.",
      "ingredients": ["tomatoes", "mozzarella", "basil"]
    },
    {
      "title": "Banana Smoothie",
      "description": "Healthy and creamy smoothie with bananas and milk.",
      "ingredients": ["bananas", "milk"]
    },
    {
      "title": "Chicken Stir-Fry",
      "description": "Quick and flavorful stir-fried chicken with vegetables.",
      "ingredients": ["chicken breast", "broccoli", "carrot", "soy sauce"]
    },
    {
      "title": "Grilled Salmon",
      "description": "Delicious grilled salmon with lemon and herbs.",
      "ingredients": ["salmon fillet", "lemon", "olive oil", "dill"]
    },
    {
      "title": "Vegetable Curry",
      "description": "Spicy and aromatic vegetable curry.",
      "ingredients": ["mixed vegetables", "coconut milk", "curry powder"]
    },
    {
      "title": "Berry Parfait",
      "description": "Layered dessert with fresh berries and yogurt.",
      "ingredients": ["berries", "yogurt", "granola"]
    }
  ]
}
''';

  @override
  Widget build(BuildContext context) {
    final data = json.decode(jsonStr);
    final recipes = (data['recipes'] as List<dynamic>).map((e) => Recipe.fromJson(e)).toList();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Recipes'),
        ),
        body: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(recipes[index].title),
          ),
        ),
      ),
    );
  }
}
