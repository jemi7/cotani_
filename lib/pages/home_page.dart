// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'register_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void logOut() {
    FirebaseAuth.instance.signOut();
  }

  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Column(
          children: <Widget> [
            const ListTile(
              leading: Icon(Icons.account_box),
              title: Text(
                'Hello, user!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Status',
                style: TextStyle(
                  fontSize: 14,
                )
              ),
            ),
          ],
        ),
        actions: [
          // Log out button
          IconButton(
            onPressed: logOut,
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Find job
                const ListTile(
                  leading: Icon(Icons.newspaper),
                  title: Text(
                    'Find Job',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Lorem ipsum dolor sit amet',
                    style: TextStyle(
                      fontSize: 14,
                    )
                  ),
                ),

                // Waste
                const ListTile(
                  leading: Icon(Icons.delete),
                  title: Text(
                    'Waste',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Lorem ipsum dolor sit amet',
                    style: TextStyle(
                      fontSize: 14,
                    )
                  ),
                ),

                // CT Store; Icons.store
                const ListTile(
                  leading: Icon(Icons.store),
                  title: Text(
                    'CT Store',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Lorem ipsum dolor sit amet',
                    style: TextStyle(
                      fontSize: 14,
                    )
                  ),
                ),

                // Dashboard
                const ListTile(
                  leading: Icon(Icons.explore),
                  title: Text(
                    'Dashboard',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Lorem ipsum dolor sit amet',
                    style: TextStyle(
                      fontSize: 14,
                    )
                  ),
                ),

                // Monitoring
                const ListTile(
                  leading: Icon(Icons.bar_chart),
                  title: Text(
                    'Monitoring',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Lorem ipsum dolor sit amet',
                    style: TextStyle(
                      fontSize: 14,
                    )
                  ),
                ),

                // CT Maps
                const ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text(
                    'Monitoring',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Lorem ipsum dolor sit amet',
                    style: TextStyle(
                      fontSize: 14,
                    )
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}