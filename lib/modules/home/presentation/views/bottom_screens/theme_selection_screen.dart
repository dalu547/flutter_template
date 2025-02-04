import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/app/resources/central_theme_manager.dart';

class ThemeSelectionScreen extends StatelessWidget {
  const ThemeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Theme')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                themeManager.setVendorTheme("Vendor1");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button color for Vendor 1
              ),
              child: const Text("Blue Theme"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                themeManager.setVendorTheme("Vendor2");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Button color for Vendor 2
              ),
              child: const Text("Red Theme"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                themeManager.setVendorTheme("Vendor3");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple, // Button color for Vendor 3
              ),
              child: const Text("Purple Theme"),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
