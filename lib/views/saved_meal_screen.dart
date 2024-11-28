import 'package:flutter/material.dart';
import 'package:meal_suggest/views/utils/bottom_navbar.dart';

class SavedMealScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final savedMeals = [
      {
        'image': 'https://picsum.photos/200/100',
        'title': 'Grilled Chicken Salad',
        'description': 'A healthy mix of grilled chicken and fresh greens.',
      },
      {
        'image': 'https://picsum.photos/200/100',
        'title': 'Spaghetti Carbonara',
        'description': 'Classic Italian pasta with creamy sauce.',
      },
      {
        'image': 'https://picsum.photos/200/100',
        'title': 'Vegetable Stir-fry',
        'description': 'A quick and delicious vegetable stir-fry.',
      },
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Saved Meals",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${savedMeals.length} Meals Saved",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: savedMeals.length,
                  itemBuilder: (context, index) {
                    final meal = savedMeals[index];
                    return _buildMealCard(context, meal);
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavbar());
  }

  Widget _buildMealCard(BuildContext context, Map<String, String> meal) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              meal['image']!,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal['title']!,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  meal['description']!,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to meal detail page
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Colors.orangeAccent,
                    ),
                    child: Text(
                      "View Details",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
