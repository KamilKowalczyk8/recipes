import 'package:flutter/material.dart';
import 'package:recipes/services/auth_service.dart';
import 'package:recipes/screens/auth/login_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  void _logout(BuildContext context) async {
    await AuthService().logout();

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[100],
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.grey[400]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Icon(Icons.local_dining, size: 37, color: Colors.black),
                SizedBox(width: 8),
                Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.restaurant,
              size: 30,
              color: Colors.black,
            ),
            title: const Text(
              'Meals',
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
            onTap: () => onSelectScreen('meals'),
          ),
          ListTile(
            leading: const Icon(Icons.tune, size: 30, color: Colors.black),
            title: const Text(
              'Filters',
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
            onTap: () => onSelectScreen('filters'),
          ),
          ListTile(
            leading: const Icon(Icons.storage, size: 30, color: Colors.black),
            title: const Text(
              'Local Recipes',
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
            onTap: () => onSelectScreen('local'),
          ),
          const Spacer(),
          ListTile(
            leading: const Icon(Icons.logout, size: 30, color: Colors.black),
            title: const Text(
              'Wyloguj się',
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
            onTap: () => _logout(context),
          ),
          const Divider(),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}
