import 'package:flutter/material.dart';
import 'package:meal_suggest/views/saved_meal_screen.dart';
import 'package:meal_suggest/views/utils/bottom_navbar.dart';

class MealDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag:
                      'meal-image', // Add a matching tag for transition animations
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://picsum.photos/200/100', // Replace with your image URL
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 16,
                  right: 16,
                  child: Text(
                    "Delicious Meal Name", // Replace with dynamic data
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: Offset(0, 1),
                          blurRadius: 6,
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(12),
              // decoration: BoxDecoration(
              //     color: Colors.grey, borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildMealInfoTile(Icons.timer, "45 min"),
                  _buildMealInfoTile(Icons.leaderboard, "Easy"),
                  _buildMealInfoTile(Icons.people, "2 Servings"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Ingredients",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildIngredientItem("1 cup of rice"),
                  _buildIngredientItem("2 tbsp of olive oil"),
                  _buildIngredientItem("200g chicken breast"),
                  _buildIngredientItem("1 tsp of salt"),
                  _buildIngredientItem("1/2 tsp of pepper"),
                  _buildIngredientItem("1 cup of vegetables"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Steps to Prepare",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStepItem(1, "Rinse the rice thoroughly and set aside."),
                  _buildStepItem(
                      2, "Heat olive oil in a pan and sauté the chicken."),
                  _buildStepItem(
                      3, "Add vegetables and stir-fry for 5 minutes."),
                  _buildStepItem(4, "Mix the rice, chicken, and vegetables."),
                  _buildStepItem(5, "Add salt and pepper to taste."),
                  _buildStepItem(6, "Cook for 20 minutes and serve hot."),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SavedMealScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.orangeAccent,
                ),
                child: Text(
                  "Save Recipe",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }

  Widget _buildMealInfoTile(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.orangeAccent),
        const SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  Widget _buildIngredientItem(String ingredient) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(Icons.circle, size: 8, color: Colors.orangeAccent),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              ingredient,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepItem(int stepNumber, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.orangeAccent,
            child: Text(
              "$stepNumber",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              description,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
