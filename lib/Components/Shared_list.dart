import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/petProvider.dart';
import 'addpetdialogue.dart'; // Ensure this path is correct

class list_shared_pref extends StatefulWidget {
  @override
  State<list_shared_pref> createState() => _list_shared_prefState();
}

class _list_shared_prefState extends State<list_shared_pref> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PetProvider>(context, listen: false).initializePets();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet List'),
      ),
      body: Consumer<PetProvider>(
        builder: (context, petProvider, child) {
          return ListView.builder(
            itemCount: petProvider.pets.length,
            itemBuilder: (context, index) {
              final pet = petProvider.pets[index];
              return ListTile(
                title: Text(pet.name),
                subtitle: Text('Type: ${pet.type}'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    petProvider.removePet(pet);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddPet()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
