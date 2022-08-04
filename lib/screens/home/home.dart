import 'dart:ffi';

import 'package:brew_crew/screens/home/settings_form.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/brew.dart';
import '../../services/database.dart';
import 'brew_list.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel(BuildContext context) {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 60,
              ),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Brew>?>.value(
      initialData: null,
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: const Text("Brew Crew"),
          backgroundColor: Colors.brown[400],
          elevation: 0,
          actions: [
            TextButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: const Text(
                'Sign Out',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton.icon(
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
              label: const Text(
                'Settings',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () => _showSettingsPanel(context),
            ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/coffee_bg.png',
              ),
              fit: BoxFit.cover,
            ),  
          ),
          child: const BrewList(),
        ),
      ),
    );
  }
}
