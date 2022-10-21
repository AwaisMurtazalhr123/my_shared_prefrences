import 'package:flutter/material.dart';
import 'package:my_shared_prefrences/models/theme_settings.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          const Card(
            child: ListTile(
              title: Text('Home'),
            ),
          ),
          Consumer<ThemeSettings>(builder: (context, value, child) {
            return SwitchListTile(
              title: const Text('Dark Theme'),
              value: value.darkTheme,
              onChanged: (newValue) {
                value.toggleTheme();
              },
            );
          }),
        ],
      ),
    );
  }
}
