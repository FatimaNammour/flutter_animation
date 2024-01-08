import 'package:flutter/material.dart';

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SharedAppBar({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:
          Text(title, style: TextStyle(color: Theme.of(context).primaryColor)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
