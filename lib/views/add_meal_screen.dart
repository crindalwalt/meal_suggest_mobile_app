import 'package:flutter/material.dart';

class AddMealScreen extends StatefulWidget {
  @override
  _AddMealScreenState createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _categories = ["Breakfast", "Lunch", "Dinner", "Snacks"];
  String? _selectedCategory;
  List<String> _ingredients = [];
  TextEditingController _ingredientController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New Meal",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Handle form submission
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Meal saved successfully!')),
                );
              }
            },
            child: Text(
              "Save",
              style: TextStyle(color: Colors.orangeAccent, fontSize: 16),
            ),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Meal Name
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Meal Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter the meal name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Category Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Category",
                  border: OutlineInputBorder(),
                ),
                value: _selectedCategory,
                items: _categories
                    .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return "Please select a category";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Description
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a description";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Ingredients
              Text(
                "Ingredients",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Wrap(
                spacing: 8.0,
                children: _ingredients
                    .map((ingredient) => Chip(
                          label: Text(ingredient),
                          onDeleted: () {
                            setState(() {
                              _ingredients.remove(ingredient);
                            });
                          },
                        ))
                    .toList(),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _ingredientController,
                      decoration: InputDecoration(
                        hintText: "Add ingredient",
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      if (_ingredientController.text.isNotEmpty) {
                        setState(() {
                          _ingredients.add(_ingredientController.text);
                          _ingredientController.clear();
                        });
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Preparation Steps
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Preparation Steps",
                  border: OutlineInputBorder(),
                ),
                maxLines: 6,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter preparation steps";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Image Picker
              GestureDetector(
                onTap: () {
                  // Implement image picker logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Image picker tapped")),
                  );
                },
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.image,
                      size: 40,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
