import 'package:flutter/material.dart';
import '../Components/Shared_list.dart'; // Ensure this path is correct

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return list_shared_pref(); // Ensure list_shared_pref is properly imported
  }
}
