import 'package:flutter/material.dart';

class Configuration extends StatefulWidget {
  const Configuration({super.key});

  @override
  State<Configuration> createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Manage People",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [],
        ),
      ),
    );
  }
}
