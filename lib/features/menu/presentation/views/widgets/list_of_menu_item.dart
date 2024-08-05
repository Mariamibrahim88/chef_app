import 'package:chef_app/features/menu/presentation/views/widgets/menu_item.dart';
import 'package:flutter/material.dart';

class ListOfItemMenu extends StatelessWidget {
  const ListOfItemMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return const menuItem();
        });
  }
}
