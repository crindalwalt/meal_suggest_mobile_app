import 'package:flutter/material.dart';
import 'package:meal_suggest/views/add_meal_screen.dart';
import 'package:meal_suggest/views/meal_detail_screen.dart';
import 'package:meal_suggest/views/search_meal_screen.dart';
import 'package:meal_suggest/views/utils/bottom_navbar.dart';
import 'package:meal_suggest/views/utils/side_drawer.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: Icon(Icons.menu)),
        title: Row(
          children: [
            Image.network(
              'https://picsum.photos/100/100',
              height: 40,
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.favorite_border, color: Colors.redAccent),
              onPressed: () {
                // Handle heart icon press
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddMealScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      drawer: SideDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const SizedBox(height: 80), // Space below the transparent AppBar
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Search meals...",
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Categories",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategoryChip(context, "Breakfast"),
                  _buildCategoryChip(context, "Lunch"),
                  _buildCategoryChip(context, "Dinner"),
                  _buildCategoryChip(context, "Snacks"),
                  _buildCategoryChip(context, "Desserts"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: 8, // Replace with the length of your meal list
                itemBuilder: (context, index) {
                  return _buildMealCard(context);
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200], // Subtle background color
      bottomNavigationBar: BottomNavbar(),
    );
  }

  Widget _buildCategoryChip(context, String label) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SearchMealScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Chip(
          label: Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.orangeAccent,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        ),
      ),
    );
  }

  Widget _buildMealCard(context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MealDetailScreen()));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                'https://picsum.photos/100/120', // Replace with actual meal image URL
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Meal Name",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Short description of the meal.",
                style: TextStyle(color: Colors.grey, fontSize: 12),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
