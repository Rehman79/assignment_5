import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pet {
  final String name;
  final String type;

  Pet({required this.name, required this.type});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type,
    };
  }

  factory Pet.fromMap(Map<String, dynamic> map) {
    return Pet(
      name: map['name'],
      type: map['type'],
    );
  }
}

class PetProvider with ChangeNotifier {
  List<Pet> _pets = [];

  List<Pet> get pets => _pets;

  PetProvider() {
    initializePets();
  }

  Future<void> initializePets() async {
    final prefs = await SharedPreferences.getInstance();
    final String? petsJson = prefs.getString('pets');
    if (petsJson != null) {
      final List<dynamic> petsList = json.decode(petsJson);
      _pets = petsList.map((pet) => Pet.fromMap(pet)).toList();
    } else {
      _pets = _getDefaultPets();
      _savePets(); // Save default pets to SharedPreferences
    }
    notifyListeners();
  }

  List<Pet> _getDefaultPets() {
    return [
      Pet(name: 'Buddy', type: 'Dog'),
      Pet(name: 'Mittens', type: 'Cat'),
      Pet(name: 'Goldie', type: 'Fish'),
      Pet(name: 'Hammy', type: 'Hamster'),
      Pet(name: 'Thumper', type: 'Rabbit'),
      Pet(name: 'Tweety', type: 'Bird'),
      Pet(name: 'Shelly', type: 'Turtle'),
    ];
  }

  Future<void> _savePets() async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> petsMap = _pets.map((pet) => pet.toMap()).toList();
    final String petsJson = json.encode(petsMap);
    await prefs.setString('pets', petsJson);
  }

  void addPet(Pet pet) {
    _pets.add(pet);
    notifyListeners();
    _savePets();
  }

  void removePet(Pet pet) {
    _pets.remove(pet);
    notifyListeners();
    _savePets();
  }
}
