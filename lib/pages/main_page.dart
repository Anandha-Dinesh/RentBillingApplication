import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import '../widgets/renters.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'RentBillingApp',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Icon(Icons.add,
                color: Theme.of(context).colorScheme.onBackground),
          ),
        ],
      ),
      drawer: const Sidebar(),
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: const Renters(),
    );
  }
}
