import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/petProvider.dart';

class AddPet extends StatelessWidget {
  const AddPet({super.key});

  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    final _typeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Add Pet")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Pet Name'),
            ),
            TextField(
              controller: _typeController,
              decoration: InputDecoration(labelText: 'Pet Type'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text;
                final type = _typeController.text;
                if (name.isNotEmpty && type.isNotEmpty) {
                  final newPet = Pet(name: name, type: type);
                  Provider.of<PetProvider>(context, listen: false).addPet(newPet);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add Pet'),
            ),
          ],
        ),
      ),
    );
  }
}
