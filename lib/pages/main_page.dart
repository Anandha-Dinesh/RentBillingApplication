import 'package:flutter/material.dart';
import 'package:rentbillingapp/pages/new_user.dart';
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
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 26),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  Navigator.pushNamed(context, '/newuser');
                },
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
