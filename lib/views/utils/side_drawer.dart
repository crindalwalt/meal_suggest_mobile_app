import 'package:flutter/material.dart';
class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // User Profile Section
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.orange),
            accountName: Text('John Doe'),
            accountEmail: Text('johndoe@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150'), // Replace with user avatar URL
            ),
          ),

          // Filter Options
          ListTile(
            leading: Icon(Icons.filter_alt),
            title: Text('Filter by Category'),
            onTap: () {
              // Action for filtering
            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Filter by Favorites'),
            onTap: () {
              // Action for filtering
            },
          ),

          Divider(),

          // Navigation Links
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Navigate to settings
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help & Feedback'),
            onTap: () {
              // Navigate to help
            },
          ),

          Spacer(),

          // Logout Button
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              // Handle logout
            },
          ),
        ],
      ),
    );
  }
}