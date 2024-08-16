import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Model/petProvider.dart';
import 'screens/Homepage.dart'; // Ensure this path is correct

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PetProvider()),
      ],
      child: MaterialApp(
        title: 'Pet List App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Homepage(),
      ),
    ),
  );
}
