import 'package:flutter/material.dart';

class SidebarItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SidebarItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18),
      ),
      onTap: onTap,
    );
  }
}
