import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Settings Screen',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _logout(context),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  void _logout(BuildContext context) {
    // Handle logout functionality here
    // For now, let's just show a simple Snackbar
    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(content: Text('You have logged out')),
    // );

    // After logout, you can navigate to the login screen, like:
    Navigator.pushReplacementNamed(context, '/login');
  }
}
